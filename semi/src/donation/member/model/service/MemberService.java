package donation.member.model.service;

import donation.member.model.dao.MemberDao;
import donation.member.model.vo.Member;
import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
public class MemberService {

	public Member login(String memberId, String memberPwd) {
		Connection con = getConnection();
		Member member = new MemberDao().selectMember(con,memberId,memberPwd);
		close(con);
		return member;
	}

	public int memberInsert(Member member) {
		Connection con = getConnection();
		int result =new MemberDao().memberInsert(con,member);
		close(con);
		return result;
	}

	public int memberInsertCheck(Member member, String memberPwd2) {
		int result = new MemberDao().memberInsertCheck(member, memberPwd2);
		return result;
	}

	public Member memberInformation(String memberId) {
		Connection con = getConnection();
		Member member = new MemberDao().memberInformation(con,memberId);
		close(con);
		return member;
	}



}
