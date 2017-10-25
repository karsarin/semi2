package donation.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.member.model.service.MemberService;
import donation.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertServlet
 */
@WebServlet("/minsert")
public class MemberInsertServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원가입 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html charset=utf-8");
		
		String memberId = request.getParameter("memberid");
		String memberPwd = request.getParameter("memberpwd1");
		String memberPwd2 = request.getParameter("memberpwd2");
		String memberName = request.getParameter("membername");
		String memberNo = request.getParameter("memberno");
		String memberNik = request.getParameter("membernik");
		String memberAddress = request.getParameter("memberaddress1") +" " + request.getParameter("memberaddress2");
		String memberEmail = request.getParameter("memberemail");
		String memberPhone = request.getParameter("memberphone");
		String[] talents = request.getParameterValues("talent");
		StringBuilder t = new StringBuilder();
		String talent = null;
		
		if(talents!=null){
			for(int i = 0; i<talents.length;i++){
				if(i<talents.length-1)
					t.append(talents[i] + ",");
				else
					t.append(talents[i]);
			}
			
			talent = t.toString();
		}else{
			talent = "";
		}
		Member member = new Member(memberId,memberPwd,memberName,memberNo,memberNik,memberAddress,memberEmail,memberPhone,null,null,talent,null,null);
		int result = new MemberService().memberInsertCheck(member,memberPwd2);
		if(result ==0){
			int result2 = new MemberService().memberInsert(member);
			if(result2 >0){
				response.sendRedirect("/semi/index.jsp");
			}else{
				RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
				request.setAttribute("message", "회원가입 실패!");
				view.forward(request, response);
			}
		}else if(result == 1){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "아이디길이 오류");
			view.forward(request, response);
		}else if(result == 2){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "아이디 영문숫자 오류");
			view.forward(request, response);
		}else if(result == 3){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "아이디 영문숫자조합 오류");
			view.forward(request, response);
		}else if(result == 4){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "비밀번호 확인 실패!");
			view.forward(request, response);
		}else if(result == 5){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "주민번호 중복!");
			view.forward(request, response);
		}else if(result == 6){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "이메일 중복!");
			view.forward(request, response);
		}else if(result == 7){
			RequestDispatcher view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "전화번호 중복!");
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
