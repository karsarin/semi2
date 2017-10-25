package donation.suggest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.suggest.model.service.SuggestService;

/**
 * Servlet implementation class SuggestDeleteServlet
 */
@WebServlet("/sugdel")
public class SuggestDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestDeleteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// suggest 삭제 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		if(new SuggestService().deleteSuggest(Integer.parseInt(request.getParameter("no"))) > 0){
			response.sendRedirect("/semi/suglist");
		}else{
			RequestDispatcher errorPage = request.getRequestDispatcher("views/suggest/suggestError.jsp");
			request.setAttribute("message", "suggest 삭제 실패!");
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
