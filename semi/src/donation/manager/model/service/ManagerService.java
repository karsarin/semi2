package donation.manager.model.service;

import static donation.common.JDBCTemplate.close;
import static donation.common.JDBCTemplate.getConnection;

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
}