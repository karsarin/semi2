package donation.member.model.dao;

import java.sql.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import static donation.common.JDBCTemplate.*;
import donation.member.model.vo.Member;
import static donation.common.JDBCTemplate.close;

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
			rset = pstmt.executeQuery();
			if(rset.next()){
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(memberPwd);
				member.setMemberName(rset.getString("member_name"));
				member.setMemberNo(rset.getString("member_no"));
				member.setMemberNik(rset.getString("member_nik"));
				member.setMemberAddress(rset.getString("member_address"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberDate(rset.getDate("member_date"));
				member.setConnection(rset.getString("connection"));
				member.setTalent(rset.getString("talent"));
				member.setMgrChat(rset.getString("manager_chatting"));
				member.setMgrLogin(rset.getString("manager_login"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
			close(pstmt);
			close(rset);
		}
		return member;
	}
	

	public int memberInsert(Connection con, Member member) {
		int result = 0;
		insertCheck(con,member);
		PreparedStatement pstmt = null;
		
		return result;
	}

	public int insertCheck(Connection con,Member member){
		Statement stmt = null;
		
		String query = "select * from member";
		int result = 0;
		try {
			stmt = con.createStatement();
			
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
			
		}
		
		
		return result;
	}


	

}
