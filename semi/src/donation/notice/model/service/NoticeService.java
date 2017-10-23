package donation.notice.model.service;

import java.util.*;


import java.sql.*;

import donation.notice.model.dao.NoticeDao;
import donation.notice.model.vo.Notice;

import static donation.common.JDBCTemplate.*;

public class NoticeService {
	public NoticeService(){}
	
	public int getListCount(){
		Connection con = getConnection();
		int listCount = new NoticeDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//페이지별 목록 조회용
	public ArrayList<Notice> selectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}
	
	public ArrayList<Notice> selectList(){
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectList(con);
		close(con);
		
		return list;
	}

	public HashMap<Integer, Notice> selectMap() {
		Connection con = getConnection();
		HashMap<Integer, Notice> map = new NoticeDao().selectMap(con);
		//select 조회이기 때문에 트랜잭션 처리 필요없음
		close(con);				
		return map;
	}
	
	public Notice selectNotice(int no) {
		Connection con = getConnection();
		Notice notice = new NoticeDao().selectOne(con, no);
		
		close(con);
		return notice;
	}

	public void addReadCount(int no) {
		Connection con = getConnection();
		int result = NoticeDao.updateReadCount(con, no);
		
		if(result > 0 ){
			commit(con);
			
		}else{
			rollback(con);
		}
		close(con);
		
		//이 메소드를 호출한 서블릿 단의 메소드가 void형이라 리턴안시킴
	}

	public int insertNotice(Notice notice) {
		
		Connection con = getConnection();
		int result = new NoticeDao().insertNotice(con, notice);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}
	public int deleteNotice(int no) {
		Connection con   = getConnection();
		
		int result = new NoticeDao().deleteNotice(con, no);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}
	public int updateNotice(Notice notice) {
		Connection con   = getConnection();
		
		int result = new NoticeDao().updateNotice(con, notice);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}
	public ArrayList<Notice> selectSearch(String keyword, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Notice> list = new NoticeDao().selectTitleSearch(con, keyword, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	public int getSearchListCount(String keyword) {
		Connection con = getConnection();
		int listCount = new NoticeDao().getSearchListCount(con, keyword);
		close(con);
		return listCount;
	}	
}



