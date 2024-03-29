package donation.freeBoard.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import donation.freeBoard.model.service.FreeBoardService;
import java.util.*;
import donation.freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardListServlet
 */
@WebServlet("/flist")
public class FreeBoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardListServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


		int currentPage = 1;
		int limit = 10;
		
		if(request.getParameter("page")!=null )
		{
			currentPage = Integer.parseInt(request.getParameter("page"));
			
		} 
		
		FreeBoardService fservice = new FreeBoardService();
		
		int listCount = fservice.getListCount();
		System.out.println("listCount : " + listCount);
		
		
		ArrayList<FreeBoard> list = fservice.selectList(currentPage, limit);
		
		System.out.println(list.toString());
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		
		int endPage = startPage + limit -1 ;
		if(maxPage < endPage) {
			endPage = maxPage;
		}
		
		RequestDispatcher view = null;
		if(list != null) {
			view = request.getRequestDispatcher("views/freeBoard/freeBoardListView.jsp");
			request.setAttribute("list",  list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage",  maxPage);
			request.setAttribute("startPage",  startPage);
			request.setAttribute("endPage",  endPage);
			request.setAttribute("listCount", listCount);
			
			
			view.forward(request, response);
			
		}else {
			view = request.getRequestDispatcher("views/freeBoard/freeBoardError.jsp");
			request.setAttribute("message", "자유게시판 페이지 불러오기 실패");
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
