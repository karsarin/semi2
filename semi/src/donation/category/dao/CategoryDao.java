package donation.category.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import static donation.common.JDBCTemplate.*;


import donation.category.vo.Category;

public class CategoryDao {

	public int getListCount(Connection con) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		
		String query = "select count(*) from category_board";
		
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			
			if(rset.next())
				result = rset.getInt(1);
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(stmt);
			close(rset);
		}
		
		return result;
	}

	public ArrayList<Category> selectList(Connection con, int currentPage, int limit) {
		// TODO Auto-generated method stub
		return null;
	}

}
