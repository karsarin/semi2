package donation.question.model.dao;

import static donation.common.JDBCTemplate.*;

import donation.question.model.vo.Question;
import java.sql.*;
import java.util.*;

public class QuestionDao {
	public QuestionDao(){}


	// 총 게시글 갯수 조회용
	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from Question";
		
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
	public ArrayList<Question> selectList(Connection con, 
			int currentPage, int limit) {
		ArrayList<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query ="select * from ("
				+ "select rownum rnum, Question_num, Question_title, "
				+ "Question_writer, Question_content, Question_original_filename, "
				+ "Question_rename_filename, Question_date, Question_level, "
				+ "Question_ref, Question_reply_ref, Question_reply_seq, "
				+ "Question_readcount from (select * from Question "
				+ "order by Question_ref desc, Question_reply_ref desc, "
				+ "Question_level asc, Question_reply_seq asc)) "
				+ "where rnum >= ? and rnum <= ?";
		
		int startRow = (currentPage -1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Question>();
				
				while(rset.next()){
					Question q = new Question();
					
					q.setQuestionNum(rset.getInt("Question_num"));
					q.setQuestionTitle(rset.getString("Question_title"));
					q.setQuestionWriter(rset.getString("Question_writer"));
					q.setQuestionContent(rset.getString("Question_content"));
					q.setQuestionDate(rset.getDate("Question_date"));
					q.setQuestionReadCount(rset.getInt("Question_readcount"));
					q.setQuestionOriginalFileName(rset.getString("Question_original_filename"));
					q.setQuestionRenameFileName(rset.getString("Question_rename_filename"));
					q.setQuestionLevel(rset.getInt("Question_level"));
					q.setQuestionRef(rset.getInt("Question_ref"));
					q.setQuestionReplyRef(rset.getInt("Question_reply_ref"));
					q.setQuestionReplySeq(rset.getInt("Question_reply_seq"));
					
					list.add(q);
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

	
	//게시글 등록 처리
	public int insertQuestion(Connection con, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into Question values ("
				+ "(select max(Question_num) + 1 from Question), "
				+ "?, ?, ?, ?, ?, sysdate, default, 0, "
				+ "(select max(Question_num) + 1 from Question), NULL, "
				+ "default, default)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getQuestionWriter());
			pstmt.setString(3, q.getQuestionContent());
			pstmt.setString(4, q.getQuestionOriginalFileName());
			pstmt.setString(5, q.getQuestionRenameFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	
	//조회수 증가 처리
	public int addReadCount(Connection con, int qnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update Question set Question_readcount = Question_readcount + 1 where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qnum);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
				
		return result;
	}


	public Question selectQuestion(Connection con, int qnum) {
		Question q = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from question where question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, qnum);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()){
				q = new Question();
				q.setQuestionNum(rset.getInt("question_num"));
				q.setQuestionTitle(rset.getString("question_title"));
				q.setQuestionWriter(rset.getString("question_writer"));
				q.setQuestionContent(rset.getString("question_content"));
				q.setQuestionDate(rset.getDate("question_date"));
				q.setQuestionReadCount(rset.getInt("question_readcount"));
				q.setQuestionOriginalFileName(rset.getString("question_original_filename"));
				q.setQuestionRenameFileName(rset.getString("question_rename_filename"));
				q.setQuestionLevel(rset.getInt("question_level"));
				q.setQuestionRef(rset.getInt("question_ref"));
				q.setQuestionReplyRef(rset.getInt("question_reply_ref"));
				q.setQuestionReplySeq(rset.getInt("question_reply_seq"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}		
		
		return q;
	}


	public int deleteQuestion(Connection con, int qnum) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		
		String query = "delete from Question where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  qnum);
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}		
				

				
		return result;
	}


	public int updateReplySeq(Connection con, Question replyQuestion) {
		int result = 0 ;
		PreparedStatement pstmt = null;
				
		String query = "update Question "
					 + "set Question_reply_seq = Question_reply_seq + 1 "
					 + "where Question_ref = ? and Question_level = ? and Question_reply_ref = ?";
		
		try {
		pstmt = con.prepareStatement(query);
		pstmt.setInt(1, replyQuestion.getQuestionRef());
		pstmt.setInt(2,  replyQuestion.getQuestionLevel());
		pstmt.setInt(3, replyQuestion.getQuestionReplyRef());
		
		result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	

	public int insertReply(Connection con, Question originQuestion, Question replyQuestion) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = null;
		
		//원글의 댓글일 때
		if(replyQuestion.getQuestionLevel()==1){
			query = "insert into Question values ("
					+ "(select max(question_num)+1 from question), "
					+ "?, ?, ?, null, null, sysdate, default, ?, ?, "
					+ "(select max(question_num)+1 from question), 1, 'Y')";
		}
		
		//댓글의 댓글일 때
		else if(replyQuestion.getQuestionLevel()==2){
			query = "insert into question values ("
					+ "(select max(question_num) + 1 from question), "
					+ "?, ?, ?, null, null, sysdate, default, ?, ?, ?, 1, 'Y')";
		}
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, replyQuestion.getQuestionTitle());
			pstmt.setString(2, replyQuestion.getQuestionWriter());
			pstmt.setString(3, replyQuestion.getQuestionContent());
			pstmt.setInt(4, replyQuestion.getQuestionLevel());
			pstmt.setInt(5, replyQuestion.getQuestionRef());			
			if(replyQuestion.getQuestionLevel() == 2)
				pstmt.setInt(6, replyQuestion.getQuestionReplyRef());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}



	public int updateReply(Connection con, Question reply) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update Question set Question_title=?, Question_content =? where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1,  reply.getQuestionTitle());
			pstmt.setString(2,  reply.getQuestionContent());
			pstmt.setInt(3,  reply.getQuestionNum());
			
			result = pstmt.executeUpdate();			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}


	public int updateQuestion(Connection con, Question q) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update Question set Question_title = ?, "
				+ "Question_content = ?, "
				+ "Question_original_filename = ?, "
				+ "Question_rename_filename = ? "
				+ "where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, q.getQuestionTitle());
			pstmt.setString(2, q.getQuestionContent());
			pstmt.setString(3, q.getQuestionOriginalFileName());
			pstmt.setString(4, q.getQuestionRenameFileName());
			pstmt.setInt(5, q.getQuestionNum());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}
	public ArrayList<Question> selectTop3(Connection con) {
		ArrayList<Question> list = null;
		Statement stmt = null;
		ResultSet rset = null;

		String query = "select * from " 
				+ "(select rownum rnum, Question_num, " 
				+ "Question_TITLE "
				+ "from (select * from Question "
				+ "where Question_level = 0 " 
				+ "order by Question_readcount desc)) " 
				+ "where rnum >= 1 and rnum <= 3";		

		try {
			stmt = con.createStatement();		

			rset = stmt.executeQuery(query);
			if (rset != null) {
				list = new ArrayList<Question>();
				while (rset.next()) {
					Question q = new Question();
					q.setQuestionNum(rset.getInt("Question_num"));
					q.setQuestionTitle(rset.getString("Question_title"));
					
					list.add(q);
				}
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}

		return list;
	}
	
	
	
	///////////////////////
	
	public ArrayList<Question> selectTitleSearch(Connection con, String keyword, int currentPage, int limit) {
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
		
		
	
		
		ArrayList<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		//currentPage 에 해당되는 목록만 조회
		String query ="select * from (select rownum rnum, Question_num, Question_title, Question_writer, Question_content, Question_original_filename, Question_rename_filename, Question_date, Question_level, Question_ref, Question_reply_ref, Question_reply_seq, Question_readcount	 from (select * from Question where question_title like ? order by Question_ref desc, Question_reply_ref desc, Question_level asc, Question_reply_seq asc))	where rnum >= ? and rnum <= ?";
		
		
		
	
		
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
				list = new ArrayList<Question>();
				while(rset.next()){
					Question q = new Question();
					
					q.setQuestionNum(rset.getInt("Question_num"));
					q.setQuestionTitle(rset.getString("Question_title"));
					q.setQuestionWriter(rset.getString("Question_writer"));
					q.setQuestionContent(rset.getString("Question_content"));
					q.setQuestionDate(rset.getDate("Question_date"));
					q.setQuestionReadCount(rset.getInt("Question_readcount"));
					q.setQuestionOriginalFileName(rset.getString("Question_original_filename"));
					q.setQuestionRenameFileName(rset.getString("Question_rename_filename"));
					q.setQuestionLevel(rset.getInt("Question_level"));
					q.setQuestionRef(rset.getInt("Question_ref"));
					q.setQuestionReplyRef(rset.getInt("Question_reply_ref"));
					q.setQuestionReplySeq(rset.getInt("Question_reply_seq"));
					
					list.add(q);


				}
				 System.out.println(" list : " + list.toString());
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
		
		String query = "select count(*) from question where question_title like ?";
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


	public int updateOriginQAnswer(Connection con, Question originQuestion) {
		int result = 0;
		PreparedStatement pstmt = null;		
		String query = "update Question set answer='Y'"
					 + "where Question_num=?";		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, originQuestion.getQuestionNum());			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}		
		return result;
	}	  
}














