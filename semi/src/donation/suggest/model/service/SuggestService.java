package donation.suggest.model.service;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
import java.util.ArrayList;

import donation.suggest.model.dao.SuggestDao;
import donation.suggest.model.vo.Suggest;


public class SuggestService {

	public ArrayList<Suggest> selectList(String suggestReciver) {
		Connection con = getConnection();
		ArrayList<Suggest> list = new SuggestDao().selectList(con, suggestReciver);
		close(con);
		return list;
	}

	public int deleteSuggest(int no) {
		Connection con = getConnection();
		int result = new SuggestDao().deleteSuggest(con, no);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	public Suggest selectSuggest(int no) {
		Connection con = getConnection();
		Suggest suggest = new SuggestDao().selectOne(con, no);
		close(con);
		return suggest;
	}

	public int sendSuggest(Suggest suggest) {
		Connection con = getConnection();
		int result = new SuggestDao().sendSuggest(con, suggest);
		if(result > 0)
			commit(con);
		else
			rollback(con);
		close(con);
		return result;
	}

	//수신자 아이디 존재 여부 확인
	public Boolean idconfirmSuggest(String suggestReciver) {
		Connection con = getConnection();
		Boolean suggest = new SuggestDao().idconfirmSuggest(con, suggestReciver);
		close(con);
		return suggest;
	}

}
