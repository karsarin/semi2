package donation.search.model.service;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;

import donation.search.model.dao.NoticeDao;
import donation.search.model.vo.Notice;

public class NoticeService {
	public NoticeService(){}

	

	public ArrayList<Notice> selectSearch(String keyword) {
		
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectTitleSearch(con,keyword);
		
		close(con);
		
		
		
		return list;
	}
}
