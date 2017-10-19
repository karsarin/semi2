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

}
