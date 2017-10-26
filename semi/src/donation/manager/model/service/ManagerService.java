package donation.manager.model.service;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import donation.category.vo.Category;
import donation.manager.model.dao.ManagerDao;
import donation.member.model.vo.Member;
import donation.question.model.vo.Question;

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

	public int getCategoryListCount() {
		Connection conn = getConnection();
		int clistCount = new ManagerDao().getCategoryListCount(conn);
		close(conn);
		return clistCount;
	}

	public ArrayList<Category> selectCategoryList(int ccurrentPage, int climit) {
		Connection conn = getConnection();
		ArrayList<Category> clist = new ManagerDao().selectCategoryList(conn, ccurrentPage, climit);
		close(conn);
		return clist;
	}

	public int getQnAListCount() {
		Connection conn = getConnection();
		int qlistCount = new ManagerDao().getQnAListCount(conn);
		close(conn);
		return qlistCount;
	}

	public ArrayList<Question> selectQnAList() {
		Connection conn = getConnection();
		ArrayList<Question> qlist = new ManagerDao().selectQnAList(conn);
		close(conn);
		return qlist;
	}
}













