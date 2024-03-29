package donation.freeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.freeBoard.model.service.FreeBoardService;
import donation.notice.model.service.NoticeService;

/**
 * Servlet implementation class NoticeDeleteServlet
 */
@WebServlet("/fdel")
public class FreeBoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//공지글 삭제 처리용 컨트롤러
		response.setContentType("text/html charset=utf-8");
		
		if( new FreeBoardService().deleteFreeBoard(Integer.parseInt(request.getParameter("no"))) > 0){
			//삭제하면 목록으로 바로 보내기
			response.sendRedirect("/semi/flist");
		}else{
			RequestDispatcher errorPage = null;
			errorPage = request.getRequestDispatcher("views/freeBoard/freeBoardEorr");
			request.setAttribute("message", "게시글삭제 실패!");
			errorPage.forward(request, response);
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
