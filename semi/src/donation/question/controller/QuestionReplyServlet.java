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
 * Servlet implementation class QuestionReplyServlet
 */
@WebServlet("/qreply")
public class QuestionReplyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public QuestionReplyServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//댓글 등록 처리용 컨트롤러
		
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		
		int currentPage = Integer.parseInt(request.getParameter("page"));
		int no = Integer.parseInt(request.getParameter("no"));
		String title = request.getParameter("title");
		String writer = request.getParameter("writer");
		String content = request.getParameter("content");
		
		
		QuestionService bservice = new QuestionService();
		
		//원글 조회
		Question originQuestion = bservice.selectQuestion(no);
		
		//댓글 객체 생성, 값 기록
		Question replyQuestion = new Question();
		replyQuestion.setQuestionContent(content);
		replyQuestion.setQuestionTitle(title);
		replyQuestion.setQuestionWriter(writer);
		replyQuestion.setQuestionLevel(originQuestion.getQuestionLevel() + 1); //원본 글의 다음 level이 되어야 원본글의 댓글 번호임
		replyQuestion.setQuestionRef(originQuestion.getQuestionRef()); //참조번호는 어떤글의 댓글인지 알려주니까 원글번호 그대로 적으면됌
		if(replyQuestion.getQuestionLevel() == 2 ) { //댓글의 댓글이면
			replyQuestion.setQuestionReplyRef(originQuestion.getQuestionNum());		
		}
		replyQuestion.setQuestionReplySeq(1);
		
		//같은 레벨의 기존 댓글의 seq 1증가 처리함
		bservice.updateReplySeq(replyQuestion);
		
		//댓글 등록 처리
		int result = bservice.insertQuestionReply(originQuestion, replyQuestion);
		
		if(result>0){
			int result2 = bservice.updateOriginQAnswer(originQuestion);
			if(result2>0) response.sendRedirect("/semi/qlist?page=" + currentPage);
			else {
				RequestDispatcher view = request.getRequestDispatcher("views/question/questionError.jsp");
				request.setAttribute("message", "원글 답변완료 상태로 업데이트 실패");
				view.forward(request, response);
			}
		}
		else{
			RequestDispatcher view = request.getRequestDispatcher("views/question/questionError.jsp");
			request.setAttribute("message", "QA 댓글 달기 실패");
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
