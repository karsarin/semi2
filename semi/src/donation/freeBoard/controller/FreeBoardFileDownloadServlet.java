package donation.freeBoard.controller;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class FileDownloadServlet
 */
@WebServlet("/ffdown")
public class FreeBoardFileDownloadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardFileDownloadServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 다운로드 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		//프로젝트 내의 저장된 파일의 폴더 경로정보 알아냄
		String savePath = request.getSession().getServletContext().getRealPath("/uploadfiles/fuploadfiles");
			// getServletContext() 세션을 가지고 있는 이 프로젝트를 의미함
			
		String originalFileName = request.getParameter("oname");
		String renameFileName = request.getParameter("rname");
		
		File downFile = new File(savePath + "/" + renameFileName);
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();//response가 가지고 있는 클라이언트의 url을 가지고 OutputStream 생성
		
		
		//읽어서 내보낼 때는 original 파일을 내보내야하는데 
		
		/*다운받으면 OS가 받아서 저장하는데  다운로드 폴더에 기본으로 저장됨
		근데 OS의 한글문자셋은  ut-8 아님
		그래서 한글이름으로 나가더라도 OS의 문자셋으로 바뀌기 때문에 분명히 한글 깨짐
		내보내는 애의 파일이름은 받아주는 OS의 문자 인코딩으로 바꿔줘야됨
		*/
		response.setContentType("text/plane; charset=utf-8");
		//파일로 내보내는건 html이라고 하면 안되고 plane으로 해야됨
	
		// 한글 파일명 인코딩 처리함 : 받아주는 시스템의 인코딩으로 변환함
		response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(originalFileName.getBytes("utf-8"), "ISO-8859-1") + "\"");  //다운로드 받을 파일명 지정하는거
		//자바에서 따옴표 안에 또 따옴표 쓰고싶을 때 역슬래쉬 \ 쓰고 " 이거 쓰면 됨
		//new String(originalFileName.getBytes("utf-8") -> String 객체를 utf-8(원래 문자에 적용된 문자셋)이 적용된 byte 객체로 바꿔줌
		
		//"utf-8" 로 된 문자열을  "ISO-8859-1"로 바꿔서 response 의 Header에 attachment해서 내보냄
		
		response.setContentLength((int)downFile.length()); //파일의 size 알아내는거 , long형으로 리턴되니까 int형으로 형변환해줌
		
		
		//저장된 폴더에서 파일을 읽어서, 클라이언트한테 내보내기  : 파일 다운
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		//파일이 txt라는 보장이 없기때문에 그냥 기본 스트림 즉, 바이트스트림 써야됨		
		
		int read = -1;
		while((read = bin.read()) != -1 ){  //다 읽으면  -1이 리턴되니까 다 읽을때 까지 돌림
			downOut.write(read);
			downOut.flush();
		}
		downOut.close();
		bin.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
