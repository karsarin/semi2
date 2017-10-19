package donation.manager.model.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import donation.member.model.vo.Member;
import static donation.common.JDBCTemplate.*;

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
					System.out.println(member);
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
}
