package donation.question.model.service;

import static donation.common.JDBCTemplate.*;
import java.sql.*;
import java.util.*;
import donation.question.model.vo.Question;
import donation.notice.model.dao.NoticeDao;
import donation.notice.model.vo.Notice;
import donation.question.model.dao.QuestionDao;

public class QuestionService {
	public QuestionService(){}
	
	//전체 게시글 갯수 조회용
	public int getListCount(){
		Connection con = getConnection();
		int listCount = new QuestionDao().getListCount(con);
		close(con);
		return listCount;
	}
	
	//페이지별 목록 조회용
	public ArrayList<Question> selectList(int currentPage, int limit){
		Connection con = getConnection();
		ArrayList<Question> list = new QuestionDao().selectList(con, currentPage, limit);
		close(con);
		return list;
	}

	//원글 등록 처리용
	public int insertQuestion(Question q) {
		Connection con = getConnection();
		int result = new QuestionDao().insertQuestion(con, q);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//조회수 1 증가 처리 
	public void addReadCount(int qnum) {
		Connection con = getConnection();
		int result = new QuestionDao().addReadCount(con, qnum);
		if(result > 0){
			commit(con);
		}else{
			rollback(con);
		}
		
		close(con);
		return ;
	}

	public Question selectQuestion(int qnum) {
		Connection con = getConnection();
		Question Question = new QuestionDao().selectQuestion(con, qnum);		
		close(con);		
		return Question;
	}

	//게시글 삭제 기능
	public int deleteQuestion(int qnum) {
		Connection con = getConnection();
		int result = new QuestionDao().deleteQuestion(con, qnum);
		if(result>0){
			commit(con);
			
		}else
			rollback(con);
			
		close(con);
			
		return result;
	}

	public void updateReplySeq(Question replyQuestion) {
		Connection con = getConnection();
		int result = new QuestionDao().updateReplySeq(con, replyQuestion);
		if(result>0){
			commit(con);
			
		}else
			rollback(con);
			
		close(con);
			
		//return ;	 생략가능	
	}

	public int insertQuestionReply(Question originQuestion, Question replyQuestion) {

		Connection con = getConnection();
		int result = new QuestionDao().insertReply(con, originQuestion, replyQuestion );
		if(result>0){
			commit(con);
			
		}else
			rollback(con);
			
		close(con);
			
		return result;
	}

	public int updateReply(Question reply) {
		Connection con = getConnection();
		int result = new QuestionDao().updateReply(con, reply);
		if(result>0){
			commit(con);
			
		}else
			rollback(con);
			
		close(con);
			
		return result;
	}

	public int updateQuestion(Question q) {
		Connection con = getConnection();
		int result = new QuestionDao().updateQuestion(con, q);
		if(result>0){
			commit(con);
			
		}else
			rollback(con);
			
		close(con);
			
		return result;
	}
	
	public ArrayList<Question> selectTop3() {
		Connection con = getConnection();
		ArrayList<Question> list = new QuestionDao().selectTop3(con);
		close(con);
		return list;
	}

	public ArrayList<Question> selectSearch(String keyword, int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Question> list = new QuestionDao().selectTitleSearch(con, keyword, currentPage, limit);
		
		close(con);
		
		return list;
		
	}
	public int getSearchListCount(String keyword) {
		Connection con = getConnection();
		int listCount = new QuestionDao().getSearchListCount(con, keyword);
		close(con);
		return listCount;
	}

	public int updateOriginQAnswer(Question originQuestion) {
		Connection con = getConnection();
		int result = new QuestionDao().updateOriginQAnswer(con, originQuestion);
		if(result>0) commit(con);
		else rollback(con);			
		close(con);
		return result;
	}	
}















