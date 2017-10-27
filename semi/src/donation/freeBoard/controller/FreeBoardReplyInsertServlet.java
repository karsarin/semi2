package donation.freeBoard.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.sql.Date;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import donation.freeBoard.model.service.FreeBoardService;
import donation.freeBoard.model.vo.CommentBoard;
import donation.freeBoard.model.vo.FreeBoard;

/**
 * Servlet implementation class FreeBoardReplyInsertServlet
 */
@WebServlet("/reInsert")
public class FreeBoardReplyInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FreeBoardReplyInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");  //JSON 객체로 내보낼때는 text/html 아님
		
		String content = request.getParameter("content");	
		String writer = request.getParameter("writer");	
		int boardNum = Integer.parseInt(request.getParameter("boardNum"));

		CommentBoard cboard = new CommentBoard(boardNum, writer, content );
		
		
		FreeBoardService fservice = new FreeBoardService();
		int result = fservice.insertReplyBoard(cboard);
		
		System.out.println("result : " + result);
		 
		

		ArrayList<CommentBoard> list = fservice.selectReplyBoardList(boardNum);
		
		
		System.out.println(list);
		
		///내보내는건 json 객체 하나만 내보낼 수 있음
		//그래서 json 배열을 json 객체에 저장함
		//내보낼 json 객체 선언
		JSONObject job = new JSONObject();
		//list 옮겨담을  json 배열 선언
		JSONArray jarr = new JSONArray();
		
		for(CommentBoard comment : list){
			//user 객체 한 개를 저장할 json 객체 선언
			JSONObject j = new JSONObject();
			j.put("commentNum", comment.getCommentNum());
			j.put("boardNum", comment.getBoardNum());
			j.put("writer", URLEncoder.encode(comment.getWriter(), "UTF-8"));
			//j.put("date", comment.getDate());
			j.put("date",  comment.getDateString());
			j.put("content", URLEncoder.encode(comment.getContent(), "UTF-8"));
			
			jarr.add(j);
		}		
		//
		job.put("list", jarr);
		System.out.println("comment job : " + job.toJSONString());
		PrintWriter pw = response.getWriter();
		//PrintWriter는 문자 스트림이기때문에 object가 나갈 수 없다. 
		//문자 스트림이므로 객체를 문자열형으로 바꿔서 내보내야 함
		pw.print(job.toJSONString());
		pw.flush();
		pw.close();
		
		
		
		
		System.out.println("파일 전송 완료");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
