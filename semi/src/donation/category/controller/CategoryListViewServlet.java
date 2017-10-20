package donation.category.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.category.service.CategoryService;
import donation.category.vo.Category;

/**
 * Servlet implementation class CategoryListView
 */
@WebServlet("/clist")
public class CategoryListViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryListViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=utf-8");
		
		// 페이지 처리용 
				int currentPage = 1;
				
				// 한 페이지에 출력할 목록 개수 지정
				int limit = 16;
				
				// 페이지 숫자가 전송이 왔을 경우 
				if(request.getParameter("page") != null)
					currentPage = Integer.parseInt(request.getParameter("page"));
					
				CategoryService cservice = new CategoryService();
				
				// 전체 목록 개수 조회함
				int clistCount = 10;
				//System.out.println("listCount : " + listCount);
				// 해당 페이지용 목록 조회
				ArrayList<Category> clist = cservice.selectList(currentPage, limit);
				
			/*	// 총 페이지 수 계산 : 목록이 최소 1개일 때는 한 페이지로 처리함
				// 페이지 1이 되려면 = 목록 0.1 개 + 0.9 계산되게 함
				int maxPage = (int)((double)clistCount / limit + 0.9);
				
				// 현재 페이지가 13이면 화면에 보여줄 시작 페이지는 11로 지정
				// (1, 11, 21, 31, ........)
				int startPage = (((int)((double)currentPage / limit + 0.9)) - 1) * limit + 1;
				
				// 만약, 목록 아래에 보여질 페이지 개수가 10개이면 
				// 현재 페이지가 13이면 끝 페이지수는 20페이지가 되어야 함
				int endPage = startPage + limit - 1;
				
				if(maxPage < endPage)
					endPage = maxPage;
				*/
				
				System.out.println("clistCount : " + clistCount);
				
				RequestDispatcher view = null;
				view = request.getRequestDispatcher("views/category/categoryListView.jsp");
				request.setAttribute("clistCount", clistCount);
				
				view.forward(request, response);
				
				/*if(clist != null)
				{
					
					
					request.setAttribute("list", clist);
					request.setAttribute("currentPage", currentPage);
					request.setAttribute("maxPage", maxPage);
					request.setAttribute("startPage", startPage);
					request.setAttribute("endPage", endPage);
					
				}else{
					view = request.getRequestDispatcher("views/board/boardError.jsp");
					request.setAttribute("message", "게시글 페이지별 조회 실패");
					view.forward(request, response);
				}*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
