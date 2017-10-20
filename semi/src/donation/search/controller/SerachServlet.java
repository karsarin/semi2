package donation.search.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.search.model.service.NoticeService;
import donation.search.model.vo.Notice;

/**
 * Servlet implementation class SerachServlet
 */
@WebServlet("/tsearch")
public class SerachServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SerachServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		String keyword = request.getParameter("keyword");

		ArrayList<Notice> list = new NoticeService().selectSearch(keyword);

		RequestDispatcher view = null;
		System.out.println("asd");
		if (list != null) {
			System.out.println("asd");
			view = request.getRequestDispatcher("views/search/search.jsp");
			request.setAttribute("list", list);
			view.forward(request, response);

		} else {
			
			view = request.getRequestDispatcher("views/search/searchError.jsp");
			request.setAttribute("message", "怨듭�湲� �젣紐� 寃��깋 �떎�뙣");
			view.forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
