package donation.member.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import donation.member.model.service.MemberService;
import donation.member.model.vo.Member;

/**
 * Servlet implementation class MemberUpdateServlet
 */
@WebServlet("/mupdate")
public class MemberUpdateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberUpdateServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 변경
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Member member1 = (Member)request.getAttribute("member");
		Member memberOrigin = new Member(
				null,
				request.getParameter("memberoriginpwd"),
				request.getParameter("memberoriginname"),
				null,
				request.getParameter("membernik"),
				request.getParameter("memberoriginaddress"),
				request.getParameter("memberoriginemail"),
				request.getParameter("memberoriginphone"),
				null,
				null,
				null,
				null,
				null);
		String memberId = request.getParameter("memberid");
		String memberName = request.getParameter("membername");
		String memberPwd1 = request.getParameter("memberpwd1");
		String memberPwd2 = request.getParameter("memberpwd2");
		String memberNik = request.getParameter("membernik");
		String memberAddress = request.getParameter("memberaddress");
		String memberEmail = request.getParameter("memberemail");
		String memberPhone = request.getParameter("memberphone");
		String[] talents = request.getParameterValues("talent");
		String memberTalent = null;
		StringBuilder talent = new StringBuilder();
		if(talents!=null){
			for(int i=0;i<talents.length;i++){
				if(i<talents.length-1)
					talent.append(talents[i] + ",");
				else
					talent.append(talents[i]);
				memberTalent = talent.toString();
			}
		}
		Member member = new Member(memberId,memberPwd1,memberName,null,memberNik,memberAddress,memberEmail,memberPhone,null,null,memberTalent,null,null);
		int result = new MemberService().updateMember(member,memberOrigin);
		RequestDispatcher view = null;
		if(memberPwd1.equals(memberPwd2)){
			if(result >0){
				Member smember = new MemberService().selectMember(memberId);
				HttpSession session = request.getSession(false);
				session.removeAttribute("member");
				session.setAttribute("member", smember);
				response.sendRedirect("/semi/index.jsp");
			}else{
				view = request.getRequestDispatcher("views/member/memberError.jsp");
				request.setAttribute("member", "ERROR");
				view.forward(request, response);
			}
		}else{
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("member", "비밀번호가 맞지않습니다");
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
