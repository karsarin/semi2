package donation.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
		
		String memberId = request.getParameter("memberid");
		String memberName = request.getParameter("membername");
		String memberPwd1 = request.getParameter("memberpwd1");
		String memberPwd2 = request.getParameter("memberpwd2");
		String memberAddress = request.getParameter("memberaddress");
		String memberEmail = request.getParameter("memberemail");
		String memberPhone = request.getParameter("memberphone");
		String[] talents = request.getParameterValues("talent");
		StringBuilder t = new StringBuilder();
		for(int i=0;i<talents.length;i++){
			if(i<talents.length-1)
				t.append(talents[i] + ",");
			else
				t.append(talents[i]);
			String talent = t.toString();
		}
		Member member = new Member(memberId,memberPwd1,memberName,null,);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
