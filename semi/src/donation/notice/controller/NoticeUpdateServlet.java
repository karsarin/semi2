package donation.notice.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import donation.notice.model.service.NoticeService;
import donation.notice.model.vo.Notice;

/**
 * Servlet implementation class NoticeUpdateServlet
 */
@WebServlet("/nupdate")
public class NoticeUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public NoticeUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 수정 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
	/*	Notice notice = new Notice();
		notice.setNoticeNo(Integer.parseInt(request.getParameter("no")));
		notice.setNoticeTitle(request.getParameter("title"));
		notice.setNoticeContent(request.getParameter("content"));*/
		
		
		//enctype 이 mulitpart 방식으로 전송되었는지 확인하는 작업이 필요함
		
		RequestDispatcher view = null;
		Notice notice = null;
		if(!ServletFileUpload.isMultipartContent(request) ){ // request를 가지고 요청된 view의 form 압축방식이  multipart 방식인지 확인함
															//ServletFileUpload 이건 cos.jar(파일 입출력 라이브러리)가 제공함 
			view = request.getRequestDispatcher("views/notice/noticeError.jsp");
			request.setAttribute("message", "form 의 enctype 속성 누락됨!");
			view.forward(request, response);
		}
			//업로드 할 파일의 용량 제한 : 10Mbyte 로 제한한다면
			int maxSize = 1024 * 1024  * 10;
			
			//업로드된 파일의 저장 위치 지정
			//해당 컨테이너(톰캣) 구동중인 웹 어플리케이션 루트 폴더(content directory)의 경로를 알아냄
			//그래서 현재 톰캣에서 구동중인 어플리케이션의 경로를 알아내서 그 폴더안에 저장되게 소스코드로 지정해줌
			//이렇게 하면 서버가 바껴도 소스 변경할 필요없음
			String root = request.getSession().getServletContext().getRealPath("/");
			//세션객체가 만들어지는  어플리케이션(context)   "/" 은 root 폴더를 의미함 
			//어플리케이션의 루트폴더를 알아내라는 뜻 
			
			//업로드 될 파일의 폴더명과 루트 폴더 연결 처리
			String savePath = root + "uploadfiles/" + "nuploadfiles";
			// web/uploadfiles 로 만들어짐
			
			//request 를 MultipartRequest 객체로 변환함
			MultipartRequest mrequest = new MultipartRequest(request, savePath, maxSize, "utf-8", new DefaultFileRenamePolicy()); 
			//MulitpartRequest 얘는 클래스
			//new MultipartRequest(request객체,  파일업로드하는 저장경로, 업로드 할 파일의 용량, 인코딩 값, 덮어쓰기 방지 클래스) 
			
			//new DefaultFileRenamePolicy()는 파일을 덮어쓰기하는게 아니라 이름 변경해서  이름(1).txt, 이름(2)tx. 이렇게 구분해서 파일 업로드하는 클래스  
					
			int no = Integer.parseInt(mrequest.getParameter("no"));			
			//이제 request가 mrequst로 바꼈기 때문에 mrequest에서 getParameter() 해야한다.
			String title = mrequest.getParameter("title");
			String writer = mrequest.getParameter("writer");
			String content = mrequest.getParameter("content");
			String originalFileName = mrequest.getFilesystemName("file"); //파일 이름만 추출
			
			
			//업로드되어 있는 파일명을 '년월일시분초.확장자' 형식으로 바꾸기 처리
			if(originalFileName != null){
				//변경할 파일명 만들기 
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				String renameFileName = sdf.format(new java.sql.Date(System.currentTimeMillis())) + "." + 
				originalFileName.substring(originalFileName.lastIndexOf(".") + 1);
				
				//파일명 바꾸려면 File 객체의 renameTo() 메소드 사용함
				File originalFile = new File(savePath + "\\" + originalFileName); // 웹에서는 경로쓸 떄 /를 쓰지만 여기서는 "\\" 사용 
				File renameFile = new File(savePath + "\\" + renameFileName); //java.io.File import 해야됨
				//성공하면 true , 실패하면 false가 리턴됨
				if(!originalFile.renameTo(renameFile)){
					//이름바꾸기가 실패했다면  원 파일의 내용을 읽어서, 복사본 파일에 옮겨 기록하고 폴더에서 원 파일을 삭제함
					int read = -1;
					byte[] buf = new byte[1024];
					
					FileInputStream fin = new FileInputStream(originalFile);
					FileOutputStream fout = new FileOutputStream(renameFile);
					
					
					while((read = fin.read(buf, 0, buf.length)) != -1){  //read에는 읽어들인 바이트 사이즈가 들어있음, 다 읽으면 -1이 들어감
						fout.write(buf, 0 , read);					
						//buf가 가진 값을 0 바이트부터 read가 가진 만큼 write해라						
					}
					fin.close();
					fout.close();
					
					//폴더에서 원 파일을 삭제함
					originalFile.delete();
			
				}
				//업로드 된 파일이 있을 경우
				 notice = new Notice(no, title, writer, content, null, originalFileName, renameFileName, 0); //불러온 값으로 notice객체 초기화
				
				
			}
			else{
				// 업로드 된 파일이 없을 경우(첨부파일이 없을 경우)
				 notice = new Notice(no, title, writer, content, null, null, null, 0); //불러온 값으로 notice객체 초기화
			}		
		
		
		
		if(new NoticeService().updateNotice(notice) > 0){
			response.sendRedirect("/semi/nlist");
		}else{
			view= request.getRequestDispatcher("views/notice/noticeError.jsp");
			request.setAttribute("message", "공지글 수정 처리 실패!");
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
