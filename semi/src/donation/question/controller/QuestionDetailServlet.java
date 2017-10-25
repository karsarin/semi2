package donation.question.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.question.model.service.QuestionService;
import donation.question.model.vo.Question;

/**
 * Servlet implementation class QuestionDetailServlet
 */
@WebServlet("/qdetail")
public class QuestionDetailServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionDetailServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 게시글 상세보기 처리용 컨트롤러
		response.setContentType("text/html; charset=utf-8");
		
		int no = Integer.parseInt(request.getParameter("no"));
		int currentPage = Integer.parseInt(request.getParameter("page"));
		
		QuestionService bservice = new QuestionService();
		
		//해당 게시글에 대한 조회수 1 증가 처리
		bservice.addReadCount(no);
		
		//해당 게시글 정보 리턴받음
		Question question = bservice.selectQuestion(no);
		
		RequestDispatcher view = null;
		if(question != null){
			view = request.getRequestDispatcher("views/question/questionDetailView.jsp");
			request.setAttribute("question", question);
			request.setAttribute("currentPage",  currentPage);
			view.forward(request, response);
			
		}else{
			view = request.getRequestDispatcher("views/question/questionError.jsp");
			request.setAttribute("message", "QA게시글 상세조회 실패!");
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
