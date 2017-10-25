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

/**
 * Servlet implementation class NoticeUpdateViewServlet
 */
@WebServlet("/fupview")
public class FreeBoardUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 공지글 수정페이지 출력 처리용 컨트롤러		
		//수정할 notice 글을 db에서 다시 불러와서 수정해야 정확함
		response.setContentType("text/html charset=utf-8");
		
		FreeBoard fboard = new FreeBoardService().selectFreeBoard(Integer.parseInt(request.getParameter("no")));
		//여기서 DB에 있는 게시글 정보 이미 불러옴
		
		
		
		RequestDispatcher view = null;
		if(fboard != null){
			view = request.getRequestDispatcher("views/freeBoard/freeBoardUpdateView.jsp");
			request.setAttribute("fboard", fboard);
			view.forward(request, response);
		}else{

			view = request.getRequestDispatcher("views/freeBoard/freeBoardError.jsp");
			request.setAttribute("message", "게시글 수정페이지 출력 처리 실패");
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
