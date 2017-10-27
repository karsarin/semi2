package donation.category.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.category.service.CategoryService;
import donation.category.vo.Category;

/**
 * Servlet implementation class CategoryUpdateViewServlet
 */
@WebServlet("/cupdate")
public class CategoryUpdateViewServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CategoryUpdateViewServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		response.setContentType("text/html; charset=utf-8");
		
		int cnum = Integer.parseInt(request.getParameter("cnum"));
		int ccurrentPage = Integer.parseInt(request.getParameter("cpage"));
		

		System.out.println(cnum);
		System.out.println(ccurrentPage);
		Category category = new CategoryService().selectCategory(cnum);
		
		RequestDispatcher view = null;
		
		if(category != null)
		{
			view = request.getRequestDispatcher("views/category/categoryUpdateView.jsp");
			
			request.setAttribute("category", category);
			request.setAttribute("ccurrentPage", ccurrentPage);
			
			view.forward(request, response);
		} else {
			view = request.getRequestDispatcher("views/category/categoryError.jsp");
			request.setAttribute("message", "수정 페이지 출력 요청 실패");
			view.forward(request, response);
			
		}
		

		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
