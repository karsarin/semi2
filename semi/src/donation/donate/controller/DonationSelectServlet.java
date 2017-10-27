package donation.donate.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.donate.model.service.DonateService;
import donation.donate.model.vo.Donate;
import donation.member.model.service.MemberService;

/**
 * Servlet implementation class DonationSelectServlet
 */
@WebServlet("/dselect")
public class DonationSelectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
        
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DonationSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 기부랭킹/기부내역조회 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String memberId = request.getParameter("memberid");

		String beforeDate = request.getParameter("beforedate");
		String afterDate = request.getParameter("afterdate");
		int result = new DonateService().donateSelectRank(memberId);
		int memberTotal = new MemberService().selectMemberNum();
		int myDonation = new DonateService().myDonationTotal(memberId);
		DonateService dservice = new DonateService();
		int currentPage = 1;
		int limit = 5;
		if(request.getParameter("page")!=null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		 
		
		int listCount = dservice.getListCount(memberId,beforeDate,afterDate);
		ArrayList<Donate> list = dservice.selectList(currentPage,limit, memberId,beforeDate,afterDate);
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		int endPage = startPage + limit -1;
		if(maxPage <endPage){
			endPage = maxPage;
		}
		RequestDispatcher view = null;
		if(result >=0&&memberTotal>=0&&myDonation>=0&&list!=null){
			view = request.getRequestDispatcher("views/member/myDonation.jsp");
			request.setAttribute("result", result);
			request.setAttribute("memberTotal", memberTotal);
			request.setAttribute("myDonation", myDonation);
			request.setAttribute("list", list);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("maxPage", maxPage);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("listCount", listCount);
			request.setAttribute("beforeDate", beforeDate);
			request.setAttribute("afterDate", afterDate);
			view.forward(request, response);
		}else if(result ==0){
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "랭킹조회 실패!");
			view.forward(request, response);
		}else if(memberTotal==0){
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "전체맴버수조회 실패!");
			view.forward(request, response);
		}else if(myDonation==-1){
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "내 전체 기부금 조회 실패!");
			view.forward(request, response);
		}else if(list == null){
			view = request.getRequestDispatcher("views/member/memberError.jsp");
			request.setAttribute("message", "내 날짜별 기부금 조회 실패!");
			view.forward(request, response);
		}
		/*sss*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
