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
		
		String memberId=request.getParameter("memberid");
		String memberPwd = request.getParameter("memberPwd");
		String memberName = request.getParameter("membername");
		String memberNo = request.getParameter("memberno");
		String memberNik = request.getParameter("membernik");
		String memberAddress = request.getParameter("memberaddress1") +" " + request.getParameter("memberaddress2");
		String memberEmail = request.getParameter("memberemail");
		String memberPhone = request.getParameter("memberphone1") + request.getParameter("memberphone2")+request.getParameter("memberphone3");
		
		Member member = new Member(memberId,memberPwd,memberName,memberNo,memberNik,memberAddress,memberEmail,memberPhone,null,null);
		int result = new MemberService().memberInsert(member);
		
		if(member!=null){
			
		}else{
			
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
