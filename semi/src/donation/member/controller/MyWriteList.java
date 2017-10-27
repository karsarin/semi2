package donation.member.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import donation.donate.model.service.DonateService;
import donation.donate.model.vo.Donate;
import donation.member.model.service.MemberService;

/**
 * Servlet implementation class MyWriteList
 */
@WebServlet("/mylist")
public class MyWriteList extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyWriteList() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 내가 쓴 글 리스트 조회 컨트롤러
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		String memberId = request.getParameter("memberid");
		
		DonateService dservice = new DonateService();
		
		int currentPage = 1;
		int limit = 20;
		if(request.getParameter("page")!=null)
			currentPage = Integer.parseInt(request.getParameter("page"));
		
		
		int listCount = dservice.getListCount(memberId);
		ArrayList<Donate> list = dservice.selectList(currentPage,limit, memberId);
		
		int maxPage = (int)((double)listCount / limit + 0.9);
		int startPage = ((int)((double)currentPage / limit + 0.9)-1) * limit + 1;
		int endPage = startPage + limit -1;
		if(maxPage <endPage){
			endPage = maxPage;
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
