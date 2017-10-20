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
		// TODO Auto-generated method stub
		return null;
	}

}
