package donation.freeBoard.controller;

import java.io.IOException;
import java.util.ArrayList;

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
 * Servlet implementation class NoticeSearchServlet
 */
@WebServlet("/fsearch")
public class FreeBoardSearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardSearchServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		//페이지 처리용
		request.setCharacterEncoding("utf-8");

		response.setContentType("text/html; charset=utf-8");
		
		
		int currentPage = 1;
		//한 페이지에 출력할 페이지 갯수 지정
		int limit = 10;
		
		//페이지 숫자가 전송이 왔을 경우
		if(request.getParameter("page") != null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		//해당 페이지용 목록 조회
		String keyword = request.getParameter("keyword");
		
		
		FreeBoardService fservice = new FreeBoardService();
		
	
		//전체 목록 갯수 조회함
		//int listCount = nservice.getListCount();
		int listSearchCount = fservice.getSearchListCount(keyword);
		
		System.out.println("currentPage : " + currentPage);
		
	
		
		ArrayList<FreeBoard> list = new FreeBoardService().selectSearch(keyword, currentPage, limit);
		//총 페이지 수 계산 : 목록이 최소 1개일 때는 한 페이지로 처리함
		//페이지 1이 되려면 = 목록 0.1 개 + 0.9 계산되게 함
		int maxPage = (int)((double)listSearchCount / limit + 0.9);
		//현재 페이지가 13이면 화면에 보여줄 시작 페이지는 11로 지정
		//(1, 11, 21, 31, .......)
		int startPage = ((int)((double)currentPage / limit + 0.9) - 1) * limit + 1;
		//만약, 목록 아래에 보여질 페이지 갯수가 10개이면
		//현재 페이지가 13이면 끝 페이지수는 20페이지가 되어야 함
		int endPage = startPage + limit - 1;
		if(maxPage < endPage)
			endPage = maxPage;
		
		RequestDispatcher view = null;
		if(list != null){
			view = request.getRequestDispatcher("views/freeBoard/freeBoardSearchListView.jsp");
			
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listSearchCount", listSearchCount);
			request.setAttribute("keyword", keyword);
			
			
			
			view.forward(request, response);
	}else{
		view = request.getRequestDispatcher("views/freeBoard/freeBoardError.jsp");
		request.setAttribute("message", "자유게시글 페이지별 조회 실패!");
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
