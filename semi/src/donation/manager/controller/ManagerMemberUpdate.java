package donation.manager.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import donation.manager.model.service.ManagerService;
import donation.member.model.vo.Member;

/**
 * Servlet implementation class ManagerMemberUpdate
 */
@WebServlet("/mgrmupdate")
public class ManagerMemberUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberUpdate() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				request.setCharacterEncoding("utf-8");
				response.setContentType("text/html; charset=utf-8");

				String memberId = request.getParameter("memberId");
				Member member = new Member();
				member.setMemberId(memberId);
				member.setMgrLogin(request.getParameter("mgrlogin"));
				member.setMgrChat(request.getParameter("mgrChat"));
				
				// 4. 모델 서비스로 전달하고, 결과받기
				int result = new ManagerService().updateMember(member);
				
				// 5. 받은 결과에 따라 뷰를 선택해서 내보냄
				RequestDispatcher rd = null;
				if(result>0) {
					response.sendRedirect("/semi/mgrmember");
				} else {
					/*rd = request.getRequestDispatcher("views/member/memberError.jsp");
					request.setAttribute("message", "회원 정보 수정 실패 !");
					rd.forward(request, response);*/
					System.out.println("회원 정보 수정 실패");
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
