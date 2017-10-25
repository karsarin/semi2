package donation.freeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.freeBoard.model.service.FreeBoardService;
import donation.freeBoard.model.vo.FreeBoard;
import donation.notice.model.service.NoticeService;
import donation.notice.model.vo.Notice;

/**
 * Servlet implementation class FreeBoardDetailServlet
 */
@WebServlet("/fdetail")
public class FreeBoardDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// a 태그로 요청온건 doGet()이 받음
				//공지글 상세 조회 처리용 컨트롤러
				response.setContentType("text/html; charset=utf-8");
				
				int no  = Integer.parseInt(request.getParameter("no"));
				
				FreeBoardService fservice  = new FreeBoardService();
				//조회수 1 증가 처리(DB에 count값을 update해야함)
				fservice.addReadCount(no); //public void - 리턴안시키고 그냥 값만 변경함
				FreeBoard fboard = fservice.selectFreeBoard(no);
				
				RequestDispatcher view = null;
				if(fboard != null){
					
					
					view = request.getRequestDispatcher("views/freeBoard/freeBoardDetailView.jsp");
					request.setAttribute("fboard", fboard);
					view.forward(request, response);
					
				}else{
					view = request.getRequestDispatcher("views/notice/noticeError.jsp");
					request.setAttribute("message", "자유게시판 상세 조회 실패!");
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
