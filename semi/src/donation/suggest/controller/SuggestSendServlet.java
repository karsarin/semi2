package donation.suggest.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Date;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import donation.suggest.model.service.SuggestService;
import donation.suggest.model.vo.Suggest;
import donation.member.model.vo.Member;


/**
 * Servlet implementation class SuggestSendServlet
 */
@WebServlet("/sugsend")
public class SuggestSendServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestSendServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//suggest 전송(등록) 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/hmtl; charset=utf-8");
		
		//enctype 이 multipart 방식으로 전송되었는지 확인
		RequestDispatcher view = null;
		Suggest suggest = null;
		
		if(!ServletFileUpload.isMultipartContent(request)){
			view = request.getRequestDispatcher("views/suggest/suggestError.jsp");
			request.setAttribute("message", "form 의 enctype 속성 누락됨!");
			view.forward(request, response);
		}
		
		//업로드할 파일의 용량 제한 : 10Mbyte 로 제한한다면
		int maxSize = 1024 * 1024 * 10;
		
		//업로드된 파일의 저장 위치 지정
		//해당 컨테이너에서 구동중인 웹 애플리케이션의 루트 폴더의 경로 알아냄
		String root = request.getSession().getServletContext().getRealPath("/");
		//업로드될 파일의 폴더명과 루트 폴더 연결처리
		String savePath = root + "suguploadfiles";
		//  web/uploadfiles 로 만들어짐
		
		//request 를 MultipartRequest 객체로 변환함
		MultipartRequest mrequest = new MultipartRequest(request, 
				savePath, maxSize, "utf-8", new DefaultFileRenamePolicy());
		
		String title = mrequest.getParameter("title");
		String content = mrequest.getParameter("content");
		String suggestOriginalFileName = mrequest.getFilesystemName("file");
		String suggestPreoid = mrequest.getParameter("preoid");
		String suggestWriter = mrequest.getParameter("writer");
		String suggestReciver = mrequest.getParameter("reciver");
		
		
		
		
		//업로드되어 있는 파일을 '년월일시분초.확장자' 형식으로 파일명 바꾸기 처리
		if(suggestOriginalFileName != null){
			//변경할 파일명 만들기
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			String suggestRenameFileName = sdf.format(new java.sql.Date(
					System.currentTimeMillis())) + "." + 
					suggestOriginalFileName.substring(suggestOriginalFileName.lastIndexOf(".") + 1);
			
			//파일명 바꾸려면 File 객체의 renameTo() 사용함
			File suggestOriginalFile = new File(savePath + "\\" + suggestOriginalFileName);
			File suggestRenameFile = new File(savePath + "\\" + suggestRenameFileName);
			
			if(!suggestOriginalFile.renameTo(suggestRenameFile)){
				//이름바꾸기 실패시
				//원 파일의 내용을 읽어서, 복사본 파일에 옮겨 기록하고
				int read = -1;
				byte[] buf = new byte[1024];
				
				FileInputStream fin = new FileInputStream(suggestOriginalFileName);
				FileOutputStream fout = new FileOutputStream(suggestRenameFileName);
				
				while((read = fin.read(buf, 0, buf.length)) != -1){
					fout.write(buf, 0, read);
				}
				
				fin.close();
				fout.close();
				
				//폴더에서 원 파일을 삭제함
				suggestOriginalFile.delete();
			}
			
			//업로드된 파일이 있을 경우
			suggest = new Suggest(0, title, suggestPreoid, content, null,
					suggestOriginalFileName, suggestRenameFileName, suggestWriter, suggestReciver);
		}else{
			//업로드된(첨부) 파일이 없을 경우
			suggest = new Suggest(0, title, suggestPreoid, content, null,
					null, null, suggestWriter, suggestReciver);
		}
		
		//수신자 아이디 존재 여부 확인
		Boolean recid = new SuggestService().idconfirmSuggest(suggestReciver);
		
		
		//수신자 아이디가 존재할 경우
		if(recid == true){
			
			//서비스로 전달하고 결과받아서 뷰 선택해서 내보내기
			if(new SuggestService().sendSuggest(suggest) > 0){
				response.sendRedirect("/semi/suglist");
				
			}else{
				
				view = request.getRequestDispatcher("views/suggest/suggestError.jsp");
				request.setAttribute("message", "suggest 전송 실패!");
				view.forward(request, response);
			}		
			
		//수신자 아이디가 존재하지 않을 경우
		}else{
			
			view = request.getRequestDispatcher("views/suggest/suggestError.jsp");
			request.setAttribute("message", "아이디가 존재하지않습니다. 확인해주세요.");
			view.forward(request, response);	
		
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
