package donation.member.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static donation.common.JDBCTemplate.*;
import donation.member.model.vo.Member;

public class MemberDao {

	public Member selectMember(Connection con, String memberId, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		
		String query = "select * from member where member_id = ? and member_pwd = ?";
		
		Member member=null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
			close(pstmt);
			close(rset);
		}
		return member;
	}
	

	public int memberInsert(Connection con, Member member) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	
	
	

}
