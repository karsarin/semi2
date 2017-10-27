package donation.freeBoard.model.service;
import static donation.common.JDBCTemplate.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.HashMap;

import donation.freeBoard.model.dao.FreeBoardDao;
import donation.freeBoard.model.vo.CommentBoard;
import donation.freeBoard.model.vo.FreeBoard;
import donation.notice.model.dao.NoticeDao;
import donation.notice.model.vo.Notice;



public class FreeBoardService {

	public int getListCount() {
		Connection con  = getConnection();
		int listCount = new FreeBoardDao().getListCount(con);
		
		close(con);
		
		return listCount;	
	}

	public ArrayList<FreeBoard> selectList( int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().selectList(con, currentPage, limit);
		close(con);			
		return list;
	}
	
	////
	
	


	
	public FreeBoard selectFreeBoard(int no) {
		Connection con = getConnection();
		FreeBoard fboard = new FreeBoardDao().selectOne(con, no);
		
		close(con);
		return fboard;
	}

	
	
	
	public void addReadCount(int no) {
		Connection con = getConnection();
		int result = FreeBoardDao.updateReadCount(con, no);
		
		if(result > 0 ){
			commit(con);
			
		}else{
			rollback(con);
		}
		close(con);
		
		//이 메소드를 호출한 서블릿 단의 메소드가 void형이라 리턴안시킴
	}

	public int insertNotice(FreeBoard fboard) {
		Connection con = getConnection();
		int result = new FreeBoardDao().insertFreeBoard(con, fboard);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		return result;
	}

	public int updateFreeBoard(FreeBoard fboard) {

		Connection con = getConnection();
		int result = new FreeBoardDao().updateFreeBoard(fboard, con);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		
		return result;
	}

	public int deleteFreeBoard(int no) {
		Connection con = getConnection();
		int result = new FreeBoardDao().deleteFreeBoard(con, no);
		if(result > 0) {
			commit(con);
		}else {
			rollback(con);
		}

		
		return result;
	}

	
	//
	public ArrayList<FreeBoard> selectSearch(String keyword, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<FreeBoard> list = new FreeBoardDao().selectTitleSearch(con, keyword, currentPage, limit);
		
		close(con);
		
		return list;
		
	}

	public int getSearchListCount(String keyword) {
		Connection con = getConnection();
		int listCount = new FreeBoardDao().getSearchListCount(con, keyword);
		close(con);
		return listCount;
	}

	public int insertReplyBoard(CommentBoard cboard) {
		Connection con = getConnection();
		int result = new FreeBoardDao().insertReplyBoard(con, cboard);
		close(con);
		return result;
	}
 
	public ArrayList<CommentBoard> selectReplyBoardList(int boardNum) {
		Connection con = getConnection();
		ArrayList<CommentBoard> list = new FreeBoardDao().selectReplyList(con, boardNum);
		
		close(con);
		
		return list;
	}


	
}


