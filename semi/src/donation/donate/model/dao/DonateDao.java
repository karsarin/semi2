package donation.donate.model.dao;

import java.sql.*;
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

}
