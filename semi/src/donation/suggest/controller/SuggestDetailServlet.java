package donation.suggest.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.suggest.model.service.SuggestService;
import donation.suggest.model.vo.Suggest;

/**
 * Servlet implementation class SuggestDetailServlet
 */
@WebServlet("/sugdetail")
public class SuggestDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SuggestDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//suggest 상세조회 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		
		SuggestService sugservice = new SuggestService();
				
		Suggest suggest = sugservice.selectSuggest(no);
		
		RequestDispatcher view = null;
		if(suggest != null){
			view = request.getRequestDispatcher("views/suggest/suggestDetailView.jsp");
			request.setAttribute("suggest", suggest);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/suggest/suggestError.jsp");
			request.setAttribute("message", "suggest 상세 조회 실패!");
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
