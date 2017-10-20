package donation.category.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

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
		ArrayList<Category> category = null;
		
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		
		String query = "select * from (select * from category_board order by category_ref desc, category_reply_ref desc, category_level asc, category_reply_seq asc) "
				+ "where rownum >= ? and rownum <= ?";
		
		int startRow = (currentPage - 1) * limit + 1;
		int endRow = startRow + limit - 1;
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, startRow);
			pstmt.setInt(2, endRow);
			
			rset = pstmt.executeQuery();
			
			if(rset != null)
			{
				category = new ArrayList<Category>();
				
				while(rset.next())
				{
					Category c = new Category();
					c.setCategoryNo(rset.getInt("category_no"));
					c.setUserId(rset.getString("user_Id"));
					c.setCategoryGroup(rset.getString("category_group"));
					c.setCategoryTitle(rset.getString("category_title"));
					c.setCategoryWriter(rset.getString("category_writer"));
					c.setCategoryContent(rset.getString("category_content"));
					c.setCategoryDate(rset.getDate("category_date"));
					c.setCategoryReadcount(rset.getInt("category_donation"));
					c.setCategoryDonation(rset.getInt("category_donation"));
					c.setWorkDate(rset.getInt("work_date"));
					c.setCategoryLevel(rset.getInt("category_level"));
					c.setCategoryRef(rset.getInt("category_ref"));
					c.setCategoryReplyRef(rset.getInt("category_reply_ref"));
					c.setCategoryReplySeq(rset.getInt("category_reply_seq"));
					c.setPhone(rset.getString("phone"));
					c.setEmail(rset.getString("email"));
					c.setOriginalImage(rset.getString("original_image"));
					c.setRenameImage(rset.getString("rename_image"));
					c.setSpecial(rset.getString("special"));
					c.setApproval(rset.getString("approval"));
					
					category.add(c);
				}
			}
			

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
			close(rset);
			
		}
		return category;
	}

}
