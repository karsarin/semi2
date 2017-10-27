package donation.donate.model.service;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;

import donation.donate.model.dao.DonateDao;
import donation.donate.model.vo.Donate;

public class DonateService {

	public int donateSelectRank(String memberId) {
		Connection con = getConnection();
		int result = new DonateDao().donateSelectRank(con,memberId);
		close(con);
		return result;
	}

	public int myDonationTotal(String memberId) {
		Connection con = getConnection();
		int donation = new DonateDao().myDonationTotal(con,memberId);
		close(con);
		return donation;
<<<<<<< HEAD
	}

	public int getListCount(String memberId) {
		Connection con = getConnection();
		int listCount = new DonateDao().getListCount(con,memberId);
		close(con);
		return listCount;
	}

	public ArrayList<Donate> selectList(int currentPage, int limit, String memberId, String beforeDate,String afterDate) {
		Connection con = getConnection();
		ArrayList<Donate> list = new DonateDao().selectList(con,currentPage,limit, memberId,beforeDate, afterDate);
		close(con);
		return list;
=======
>>>>>>> refs/remotes/origin/yunJisun
	}

}
