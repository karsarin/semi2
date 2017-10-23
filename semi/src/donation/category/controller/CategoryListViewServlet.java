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
				int ccurrentPage = 1;
				
				// 한 페이지에 출력할 목록 개수 지정
				int climit = 10;
				
				// 페이지 숫자가 전송이 왔을 경우 
				if(request.getParameter("page") != null)
					ccurrentPage = Integer.parseInt(request.getParameter("page"));
					
				CategoryService cservice = new CategoryService();
				
				// 전체 목록 개수 조회함
				int clistCount = 10;
				//System.out.println("listCount : " + listCount);
				// 해당 페이지용 목록 조회
				ArrayList<Category> clist = cservice.selectList(ccurrentPage, climit);
				
				// 총 페이지 수 계산 : 목록이 최소 1개일 때는 한 페이지로 처리함
				// 페이지 1이 되려면 = 목록 0.1 개 + 0.9 계산되게 함
				int cmaxPage = (int)((double)clistCount / climit + 0.9);
				
				// 현재 페이지가 13이면 화면에 보여줄 시작 페이지는 11로 지정
				// (1, 11, 21, 31, ........)
				int cstartPage = (((int)((double)ccurrentPage / climit + 0.9)) - 1) * climit + 1;
				
				// 만약, 목록 아래에 보여질 페이지 개수가 10개이면 
				// 현재 페이지가 13이면 끝 페이지수는 20페이지가 되어야 함
				int cendPage = cstartPage + climit - 1;
				
				if(cmaxPage < cendPage)
					cendPage = cmaxPage;
				
				RequestDispatcher view = null;					
				
				if(clist != null)
				{
					
					view = request.getRequestDispatcher("views/category/categoryListView.jsp");
					request.setAttribute("clist", clist);
					request.setAttribute("ccurrentPage", ccurrentPage);
					request.setAttribute("cmaxPage", cmaxPage);
					request.setAttribute("cstartPage", cstartPage);
					request.setAttribute("cendPage", cendPage);
					request.setAttribute("clistCount", clistCount);
					view.forward(request, response);
					
				}else{
					view = request.getRequestDispatcher("views/category/categoryError.jsp");
					request.setAttribute("message", "카테고리 조회 실패");
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
