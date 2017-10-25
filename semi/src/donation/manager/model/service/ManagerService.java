package donation.manager.model.service;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import donation.manager.model.dao.ManagerDao;
import donation.member.model.vo.Member;

public class ManagerService {
	public ManagerService(){}

	public ArrayList<Member> selectAllMember() {
		Connection conn = getConnection();
		ArrayList<Member> list = new ManagerDao().selectAllMember(conn);
		close(conn);
		return list;
	}

	public Member selectMember(String memberId) {
		Connection conn = getConnection();
		Member member = new ManagerDao().selectMember(conn, memberId);
		close(conn);
		return member;
	}

	public int updateMember(Member member) {
		Connection conn = getConnection();
		int result = new ManagerDao().updateMember(conn, member);
		if(result>0)commit(conn);
		else rollback(conn);
		close(conn);
		return result;
	}
}
