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
 * Servlet implementation class MemberInformationServlet
 */
@WebServlet("/minfor")
public class MemberInformationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInformationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 회원정보 확인
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		Member member = new MemberService().memberInformation(request.getParameter("userid"));
		RequestDispatcher view = null;
		if(member!=null){
			view = request.getRequestDispatcher("views/member/myInformation.jsp");
			request.setAttribute("member", member);
			view.forward(request, response);
		}else{
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "회원정보 실패!!");
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
