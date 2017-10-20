package donation.notice.model.dao;

import java.sql.*;
import java.util.*;

import donation.notice.model.vo.Notice;

import static donation.common.JDBCTemplate.close;
import static donation.common.JDBCTemplate.*;

public class NoticeDao {
	public NoticeDao(){}
	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				result = rset.getInt(1);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		
		return result;
	}

	// 한 페이지에 출력할 게시글 목록 조회용
	public ArrayList<Notice> selectList(Connection con, 
			int currentPage, int limit) {
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query ="select * from ("
				+ "select rownum rnum, NOTICE_NO, NOTICE_TITLE, "
				+ "NOTICE_WRITER, NOTICE_CONTENT, NOTICE_DATE, "
				+ "ORIGINAL_FILENAME, RENAME_FILENAME, READ_COUNT "
				+ "from (select * from notice order by NOTICE_NO desc "
				+ " )) "
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Notice>();
				
				while(rset.next()){
					Notice notice = new Notice();
					
					notice = new Notice();
					notice.setNoticeNo(rset.getInt("NOTICE_NO"));
					notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
					notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
					notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
					notice.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
					notice.setRenameFileName(rset.getString("RENAME_FILENAME"));
					notice.setReadCount(rset.getInt("READ_COUNT"));
					
					list.add(notice);
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
	}

	public ArrayList<Notice> selectList(Connection con){
		ArrayList<Notice> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice order by notice_no desc";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				list = new ArrayList<Notice>();
								
				while(rset.next()){
					Notice n = new Notice();
					n.setNoticeNo(rset.getInt("NOTICE_NO"));
					n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					n.setNoticeWriter(rset.getString("NOTICE_WRITER"));
					n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
					n.setNoticeDate(rset.getDate("NOTICE_DATE"));
					n.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
					n.setRenameFileName(rset.getString("RENAME_FILENAME"));
					n.setReadCount(rset.getInt("READ_COUNT"));
					
					
					list.add(n); //map에는 객체만 와야되는데 n.getNoticeNo()는 int형, 근데  AutoBoxing 됨
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}		
		
		return list;		
	}
	
	
	public HashMap<Integer, Notice> selectMap(Connection con) {

		HashMap<Integer, Notice> map = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from notice";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset != null){
				map = new HashMap<Integer, Notice>();
								
				while(rset.next()){
					Notice n = new Notice();
					n.setNoticeNo(rset.getInt("NOTICE_NO"));
					n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					n.setNoticeWriter(rset.getString("NOTICE_WRITER"));
					n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
					n.setNoticeDate(rset.getDate("NOTICE_DATE"));
					n.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
					n.setRenameFileName(rset.getString("RENAME_FILENAME"));
					n.setReadCount(rset.getInt("READ_COUNT"));
					
					
					map.put(n.getNoticeNo(), n); //map에는 객체만 와야되는데 n.getNoticeNo()는 int형, 근데  AutoBoxing 됨
				}
			}
		} catch (Exception e) {

			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return map;
	}

	public Notice selectOne(Connection con, int no) {
		Notice notice = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where notice_no = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  no);
			
			rset = pstmt.executeQuery();
			if(rset.next())//pk로 조회한건 결과가 한개니까 if문 사용
			{
				notice = new Notice();
				notice.setNoticeNo(rset.getInt("NOTICE_NO"));
				notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
				notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
				notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
				notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
				notice.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
				notice.setRenameFileName(rset.getString("RENAME_FILENAME"));
				notice.setReadCount(rset.getInt("READ_COUNT"));
				
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		
		return notice;
	}

	public static int updateReadCount(Connection con, int no) {
		
		int result = 0;
		
		PreparedStatement pstmt = null;
		String query = "update notice set read_count = read_count + 1 where notice_no = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			result = pstmt.executeUpdate();
						
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}		
		return result;
	}

	public int insertNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into notice values "
				+ "((select max(notice_no) + 1 from notice), "
				+ "?, ?, ?, default, ?, ?, default)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeWriter());
			pstmt.setString(3, notice.getNoticeContent());
			pstmt.setString(4, notice.getOriginalFileName());
			pstmt.setString(5, notice.getRenameFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}			
		return result;
	}

	public int deleteNotice(Connection con, int no) {
		int result = 0;		
		PreparedStatement pstmt = null;
		
		String query = "delete from notice where notice_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  no);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}		
		return result;
	}

	public int updateNotice(Connection con, Notice notice) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update notice set notice_title=?, notice_content = ?, ORIGINAL_FILENAME=?, RENAME_FILENAME=? where notice_no = ?";
		
		try {
			pstmt= con.prepareStatement(query);
			pstmt.setString(1, notice.getNoticeTitle());
			pstmt.setString(2, notice.getNoticeContent());
			pstmt.setString(3, notice.getOriginalFileName());
			pstmt.setString(4, notice.getRenameFileName());
			pstmt.setInt(5, notice.getNoticeNo());
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(pstmt);
		}
		return result;
	}

	public ArrayList<Notice> selectTitleSearch(Connection con, String keyword, int currentPage, int limit) {
		/*ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from notice where notice_title like ? order by notice_no desc";
																//여기서 like 뒤에 % 쓰면안됨 여기는 ?만 쓰고 setString할 때 문자열 값으로 추가시켜줘야됨
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Notice>();
								
				while(rset.next()){
					Notice n = new Notice();
					n.setNoticeNo(rset.getInt("NOTICE_NO"));
					n.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					n.setNoticeWriter(rset.getString("NOTICE_WRITER"));
					n.setNoticeContent(rset.getString("NOTICE_CONTENT"));
					n.setNoticeDate(rset.getDate("NOTICE_DATE"));
					n.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
					n.setRenameFileName(rset.getString("RENAME_FILENAME"));
					n.setReadCount(rset.getInt("READ_COUNT"));
					
					
					list.add(n); //map에는 객체만 와야되는데 n.getNoticeNo()는 int형, 근데  AutoBoxing 됨
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}		
		
		return list;	*/
		
		
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query ="select * from ("
				+ "select rownum rnum, NOTICE_NO, NOTICE_TITLE, "
				+ "NOTICE_WRITER, NOTICE_CONTENT, NOTICE_DATE, "
				+ "ORIGINAL_FILENAME, RENAME_FILENAME, READ_COUNT "
				+ "from (select * from notice where notice_title like ? order by NOTICE_NO desc "
				+ " )) "
				+ "where rnum >= ? and rnum <= ?";
		System.out.println("currentPage :" + currentPage);
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Notice>();
				
				while(rset.next()){
					Notice notice = new Notice();
					
					notice = new Notice();
					notice.setNoticeNo(rset.getInt("NOTICE_NO"));
					notice.setNoticeTitle(rset.getString("NOTICE_TITLE"));
					notice.setNoticeWriter(rset.getString("NOTICE_WRITER"));
					notice.setNoticeContent(rset.getString("NOTICE_CONTENT"));
					notice.setNoticeDate(rset.getDate("NOTICE_DATE"));
					notice.setOriginalFileName(rset.getString("ORIGINAL_FILENAME"));
					notice.setRenameFileName(rset.getString("RENAME_FILENAME"));
					notice.setReadCount(rset.getInt("READ_COUNT"));
					
					list.add(notice);
					
					System.out.println(list.toString());
				}
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return list;
		
	}
	public int getSearchListCount(Connection con, String keyword) {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from notice where notice_title like ?";
		//여기서 like 뒤에 % 쓰면안됨 여기는 ?만 쓰고 setString할 때 문자열 값으로 추가시켜줘야됨
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%" + keyword + "%");
		
			rset = pstmt.executeQuery();
			
			if(rset.next())
				result = rset.getInt(1);
			
		} 
		
		
		catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}		

		
		System.out.println(result);
		return result;

		
		
		
	}	
}


