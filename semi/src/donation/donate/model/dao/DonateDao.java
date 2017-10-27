package donation.donate.model.dao;

import java.sql.*;
import java.util.ArrayList;

import static donation.common.JDBCTemplate.*;
import donation.donate.model.vo.Donate;

public class DonateDao {

	public int donateSelectRank(Connection con, String memberId) {
		PreparedStatement pstmt=null;
		ResultSet rset = null;
		int result = 0;
		String query = "select * from "
				+ "(select rownum, member_id from"
				+ "(select member_id, sum(donation) from donate group by member_id order by sum(donation) desc))"
				+ "where member_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset=pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return result;
	}

	public int myDonationTotal(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Donate donate = null;
		int donation = -1;
		String query = "select sum(donation) from donate where member_id=?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()){
				donation = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
			close(rset);
		}
		return donation;
	}

	public int getListCount(Connection con, String memberId, String beforeDate,String afterDate) {
		// 내 기부횟수 총 갯수 조회
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		if(afterDate==null || afterDate.equals("")|| afterDate.equals("null")){
			afterDate = "sysdate";
		} 
		if(beforeDate == null || beforeDate.equals("") || beforeDate.equals("null")){
			beforeDate = "2000-01-01";
		}
		  
		String query = "select count(*) from donate where member_id = ?"
					 + " and to_char(donation_date,?) BETWEEN ? and ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, "yyyy-MM-dd");
			pstmt.setString(3, beforeDate);
			pstmt.setString(4, afterDate);
			rset = pstmt.executeQuery();
			if(rset.next())
				result = rset.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Donate> selectList(Connection con, int currentPage, int limit, String memberId, String beforeDate, String afterDate) {
		ArrayList<Donate> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;

		if(afterDate==null || afterDate.equals("")|| afterDate.equals("null")){
			afterDate = "sysdate";
		}
		if(beforeDate == null || beforeDate.equals("") || beforeDate.equals("null")){
			beforeDate = "2000-01-01";
		}
		
		String query = "select * from ("
				+ "select rownum rnum,donation_no,category_title,donation,donation_date from("
				+ "select * from donate join category_board using(category_no) order by 4)"
				+ " where member_id = ?)where rnum>=? and rnum<=? and to_char(donation_date,?) BETWEEN ? and ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit -1;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			pstmt.setString(4, "yyyy-MM-dd");
			pstmt.setString(5, beforeDate);
			pstmt.setString(6, afterDate);
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Donate>();
				
				while(rset.next()){
					Donate donate = new Donate();
					donate.setDonationNo(rset.getInt(1));
					donate.setMemberId(rset.getString("category_title"));
					donate.setDonation(rset.getInt("donation"));
					donate.setDonationDate(rset.getDate("donation_date"));
					
					list.add(donate);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return list;
	}

}
