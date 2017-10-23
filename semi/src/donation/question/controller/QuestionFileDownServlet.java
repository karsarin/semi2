package donation.question.controller;

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
 * Servlet implementation class QuestionFileDownServlet
 */
@WebServlet("/qfdown")
public class QuestionFileDownServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionFileDownServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//파일 다운로드 처리용 컨트롤러
		request.setCharacterEncoding("utf-8");
		
		String originalFileName = request.getParameter("ofile");
		String renameFileName = request.getParameter("rfile");
		
		//프로젝트 내에 파일이 저장된 폴더의 경로 정보 얻어옴
		String savePath = request.getSession().getServletContext().getRealPath("/quploadfiles");
		
		//클라이언트로 내보낼 출력 스트림 생성
		ServletOutputStream downOut = response.getOutputStream();
		
		File downFile = new File(savePath + "/" + renameFileName);
		response.setContentType("text/plane; charset=utf-8");
		
		//이대로 다운받으면 브라우저까지는 한글명이 제대로 가지만 다운로드 받을 때 os의 인코딩 방식이 다르기 때문에 한글 파일명이 깨진다.
		// 그래서 한글 파일명을 다운될 os의 문자셋으로 인토딩 처리함
		response.addHeader("Content-Disposition", "attachment; filename=\"" + new String(originalFileName.getBytes("UTF-8"), "ISO-8859-1") + "\"" );

		//originalFileName.getBytes("UTF-8")  -> utf-8로 되어있는 originalFileName을 바이트 형식으로 바꿔줌
		
		response.setContentLength((int)downFile.length());   //downFile.length() 이건 long형으로 반환되서 int 형 변환 해줘야됨
		
		//저장된 폴더의 파일을 읽어서 출력 스트림으로 내보냄
		//파일 읽기용 스트림 생성
		BufferedInputStream bin = new BufferedInputStream(new FileInputStream(downFile));
		//IOException이 필요하지만 이미 doGet 메소드에서는 throw IOException 하고 있기때문에 필요없다.
		//대상파일인 downFile 파일에 버퍼 스트림 객체(파일 가져올 수 있는 통로)를 붙여서 저장된 파일을 read한다.
		
		
		int read = -1;
		while((read = bin.read()) != -1){  //리턴값이 없으면 -1을 리턴함
			downOut.write(read); //downFile 을 read한 데이터를 downOut 스트림을 통해 write 해서 파일 생성해준다.
			downOut.flush(); //Buffer를 이용했기때문에 flush 해줌
			
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
