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
					Question b = new Question();
					
					b.setQuestionNum(rset.getInt("Question_num"));
					b.setQuestionTitle(rset.getString("Question_title"));
					b.setQuestionWriter(rset.getString("Question_writer"));
					b.setQuestionContent(rset.getString("Question_content"));
					b.setQuestionDate(rset.getDate("Question_date"));
					b.setQuestionReadCount(rset.getInt("Question_readcount"));
					b.setQuestionOriginalFileName(rset.getString("Question_original_filename"));
					b.setQuestionRenameFileName(rset.getString("Question_rename_filename"));
					b.setQuestionLevel(rset.getInt("Question_level"));
					b.setQuestionRef(rset.getInt("Question_ref"));
					b.setQuestionReplyRef(rset.getInt("Question_reply_ref"));
					b.setQuestionReplySeq(rset.getInt("Question_reply_seq"));
					
					list.add(b);
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
	public int insertQuestion(Connection con, Question b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into Question values ("
				+ "(select max(Question_num) + 1 from Question), "
				+ "?, ?, ?, ?, ?, sysdate, default, 0, "
				+ "(select max(Question_num) + 1 from Question), NULL, "
				+ "default)";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getQuestionTitle());
			pstmt.setString(2, b.getQuestionWriter());
			pstmt.setString(3, b.getQuestionContent());
			pstmt.setString(4, b.getQuestionOriginalFileName());
			pstmt.setString(5, b.getQuestionRenameFileName());
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		
		return result;
	}

	
	//조회수 증가 처리
	public int addReadCount(Connection con, int bnum) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update Question set Question_readcount = Question_readcount + 1 where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bnum);
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
				
		return result;
	}


	public Question selectQuestion(Connection con, int bnum) {
		Question Question = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from Question where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, bnum);
			
			rset = pstmt.executeQuery();
			
			
			if(rset.next()){
				Question = new Question();
				Question.setQuestionNum(rset.getInt("Question_num"));
				Question.setQuestionTitle(rset.getString("Question_title"));
				Question.setQuestionWriter(rset.getString("Question_writer"));
				Question.setQuestionContent(rset.getString("Question_content"));
				Question.setQuestionDate(rset.getDate("Question_date"));
				Question.setQuestionReadCount(rset.getInt("Question_readcount"));
				Question.setQuestionOriginalFileName(rset.getString("Question_original_filename"));
				Question.setQuestionRenameFileName(rset.getString("Question_rename_filename"));
				Question.setQuestionLevel(rset.getInt("Question_level"));
				Question.setQuestionRef(rset.getInt("Question_ref"));
				Question.setQuestionReplyRef(rset.getInt("Question_reply_ref"));
				Question.setQuestionReplySeq(rset.getInt("Question_reply_seq"));
			}
			
		} catch (Exception e) {
			// TODO: handle exception
		}finally{
			close(rset);
			close(pstmt);
		}		
		
		return Question;
	}


	public int deleteQuestion(Connection con, int bnum) {
		int result = 0 ;
		PreparedStatement pstmt = null;
		
		String query = "delete from Question where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1,  bnum);
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
				
		String query = "update Question set Question_reply_seq = Question_reply_seq + 1 where Question_ref = ? and Question_level = ? and Question_reply_ref = ?";
		
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
		if(replyQuestion.getQuestionLevel() == 1){
			query = "insert into Question values ("
					+ "(select max(Question_num) + 1 from Question), "
					+ "?, ?, ?, null, null, sysdate, default, ?, ?, "
					+ "(select max(Question_num) + 1 from Question), "
					+ "1)";
		}
		
		//댓글의 댓글일 때
		if(replyQuestion.getQuestionLevel() == 2){
			query = "insert into Question values ("
					+ "(select max(Question_num) + 1 from Question), "
					+ "?, ?, ?, null, null, sysdate, default, ?, ?, ?, "
					+ "1)";
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


	public int updateQuestion(Connection con, Question b) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "update Question set Question_title = ?, "
				+ "Question_content = ?, "
				+ "Question_original_filename = ?, "
				+ "Question_rename_filename = ? "
				+ "where Question_num = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, b.getQuestionTitle());
			pstmt.setString(2, b.getQuestionContent());
			pstmt.setString(3, b.getQuestionOriginalFileName());
			pstmt.setString(4, b.getQuestionRenameFileName());
			pstmt.setInt(5, b.getQuestionNum());
			
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
					Question b = new Question();
					b.setQuestionNum(rset.getInt("Question_num"));
					b.setQuestionTitle(rset.getString("Question_title"));
					
					list.add(b);
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
	
}














