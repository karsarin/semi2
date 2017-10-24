package donation.manager.model.dao;

import static donation.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import donation.member.model.vo.Member;

public class ManagerDao {
	public ManagerDao(){}

	public ArrayList<Member> selectAllMember(Connection conn) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from member";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset!=null) {
				list = new ArrayList<Member>();
				while(rset.next()) {
					Member member = new Member(
							rset.getString("member_id"), rset.getString("member_pwd"), rset.getString("member_name"),
							rset.getString("member_no"), rset.getString("member_nik"), rset.getString("member_address"),
							rset.getString("member_email"), rset.getString("member_phone"), rset.getDate("signup_date"),
							rset.getString("connection"), rset.getString("talent"), rset.getString("mgrchat"), rset.getString("mgrlogin")
					);
					list.add(member);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return list;
	}

	public Member selectMember(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member(
						rset.getString("member_id"), rset.getString("member_pwd"), rset.getString("member_name"),
						rset.getString("member_no"), rset.getString("member_nik"), rset.getString("member_address"),
						rset.getString("member_email"), rset.getString("member_phone"), rset.getDate("signup_date"),
						rset.getString("connection"), rset.getString("talent"), rset.getString("mgrchat"), rset.getString("mgrlogin")
				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set mgrchat=?, mgrlogin=? "
					 + "where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMgrChat());
			pstmt.setString(2, member.getMgrLogin());
			pstmt.setString(3, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}
}
