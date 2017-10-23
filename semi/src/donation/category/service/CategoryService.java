package donation.category.service;

import java.sql.Connection;
import java.util.ArrayList;
import static donation.common.JDBCTemplate.*;

import donation.category.dao.CategoryDao;
import donation.category.vo.Category;

public class CategoryService {

	public int getListCount() {
		Connection con = getConnection();
		int result = new CategoryDao().getListCount(con);
		close(con);
		return result;
	}
	
	public ArrayList<Category> selectList(int currentPage, int limit) {
		Connection con = getConnection();
		ArrayList<Category> category = new CategoryDao().selectList(con, currentPage, limit);
		close(con);
		
		return category;
	}

	public void addReadCount(int cnum) {
		Connection con = getConnection();
		int result = new CategoryDao().addReadCount(con, cnum);
		if(result > 0)
			commit(con);
		else rollback(con);
		close(con);
		
		return;
		
		
	}

	public int deleteBoard(int cnum) {
		Connection con = getConnection();
		int result = new CategoryDao().deleteBoard(con, cnum);
		
		if(result > 0)
			commit(con);
		else rollback(con);
		return result;
	}

	public int insertCategory(Category c) {
		Connection con = getConnection();
		int result = new CategoryDao().insertCategory(con, c);
		
		if(result > 0)
			commit(con);
		else rollback(con);
		
		close(con);
		
		return result;
	}

	public Category selectCategory(int cnum) {
		Connection con = getConnection();
		
		Category category = new CategoryDao().selectCategory(con, cnum);
		close(con);
		return category;
	}

}
