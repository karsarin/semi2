package donation.manager.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import donation.manager.model.service.ManagerService;
import donation.member.model.vo.Member;

/**
 * Servlet implementation class ManagerMemberDetail
 */
@WebServlet("/mgrmemberdetail")
public class ManagerMemberDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ManagerMemberDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("application/json; charset=utf-8");
		
		Member member = new ManagerService().selectMember(request.getParameter("memberId"));
		
		JSONObject job = new JSONObject();
		job.put("memberId", member.getMemberId());
		job.put("memberNik", URLEncoder.encode(member.getMemberNik(), "UTF-8"));
		job.put("memberName", URLEncoder.encode(member.getMemberName(),"UTF-8"));
		job.put("memberPhone", member.getMemberPhone());
		job.put("memberEmail", member.getMemberEmail());
		job.put("memberAddress", URLEncoder.encode(member.getMemberAddress(),"UTF-8"));
		job.put("talent", URLEncoder.encode(member.getTalent(),"UTF-8"));
		job.put("mgrChat", member.getMgrChat());
		job.put("mgrLogin", member.getMgrLogin());
		
		PrintWriter pw = response.getWriter();
		pw.print(job.toJSONString());
		pw.flush();
		pw.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
