package donation.search.model.dao;

import static donation.common.JDBCTemplate.*;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;

import donation.search.model.vo.Notice;

public class NoticeDao {
	public NoticeDao(){}
		
	public ArrayList<Notice> selectTitleSearch(Connection con, String keyword) {
		// TODO Auto-generated method stub
		
		ArrayList<Notice> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from CATEGORY_BOARD "
				+ "where category_title like ? order by category_no desc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, "%"+keyword + "%");
			rset = pstmt.executeQuery();
			if(rset != null)
			{
				list = new ArrayList<Notice>();
				
				while(rset.next())
				{
					Notice n = new Notice();
					
					n.setCategoryNo(rset.getInt("category_no"));
					n.setUserId(rset.getString("user_id"));
					n.setCategoryGroup(rset.getString("category_title"));
					n.setCategoryTitle(rset.getString("category_title"));
					n.setCategoryWriter(rset.getString("category_writer"));
					n.setCategoryContent(rset.getString("category_content"));
					n.setCategoryDate(rset.getDate("category_date"));
					n.setCategoryReadcount(rset.getInt("category_readcount"));
					n.setCategoryDonation(rset.getInt("category_donation"));
					n.setWorkDate(rset.getInt("work_date"));
					n.setCategoryLevel(rset.getInt("category_level"));
					n.setCategoryRef(rset.getInt("category_ref"));
					n.setCategoryReplyRef(rset.getInt("category_reply_ref"));
					n.setCategoryReplySeq(rset.getInt("category_reply_seq"));
					n.setPhone(rset.getString("phone"));
					n.setEmail(rset.getString("email"));
					n.setOriginalImage(rset.getString("original_image"));
					n.setRenameImage(rset.getString("rename_image"));
					n.setSpecial(rset.getString("special"));
					n.setApproval(rset.getString("approval"));		
					
					list.add(n);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			close(pstmt);
			close(rset);
		}
		
		return list;
		
		
	
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
