package donation.member.model.service;

import donation.member.model.dao.MemberDao;
import donation.member.model.vo.Member;
import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
public class MemberService {

	public Member login(String memberId, String memberPwd) {
		Connection con = getConnection();
		
		Member member = new MemberDao().selectMember(con,memberId,memberPwd);
		if(member!=null){
			int login = new MemberDao().login(con,memberId);
		}
		close(con);
		return member;
	}

	public int memberInsert(Member member) {
		Connection con = getConnection();
		int result =new MemberDao().memberInsert(con,member);
		if(con != null)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int memberInsertCheck(Member member, String memberPwd2) {
		Connection con = getConnection();
		int result = new MemberDao().memberInsertCheck(con, member, memberPwd2);
		return result;
	}

	public Member memberInformation(String memberId) {
		Connection con = getConnection();
		Member member = new MemberDao().memberInformation(con,memberId);
		close(con);
		return member;
	}

	public int updateMember(Member member,Member memberOrigin) {
		Connection con = getConnection();
		int result = new MemberDao().updateMember(con, member, memberOrigin);
		if(con !=null){
			commit(con);
		}else{
			rollback(con);
		}
		close(con);
		return result;
	}

	public Member selectMember(String memberId) {
		Connection con = getConnection();
		Member member = new MemberDao().selectMember(con, memberId);
		close(con);
		return member;
	}

	public int deleteMember(String memberId) {
		Connection con = getConnection();
		int result = new MemberDao().deleteMember(con, memberId);
		if(con!=null)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public int memberIdCheck(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().memberIdCheck(con, member);
		close(con);
		return result;
	}
	public int memberNikCheck(Member member) {
		Connection con = getConnection();
		int result = new MemberDao().memberNikCheck(con, member);
		close(con);
		return result;
	}

	public int selectMemberNum() {
		Connection con = getConnection();
		int result = new MemberDao().selectMemberNum(con);
		close(con);
		return result;
	}

	public void logout(String memberId) {
		Connection con = getConnection();
		new MemberDao().logout(con,memberId);
		
	}



}
