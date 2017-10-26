package donation.suggest.model.dao;

import static donation.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import donation.member.model.vo.Member;
import donation.suggest.model.vo.Suggest;

public class SuggestDao {

	//수신자 아이디 받아와야 됨
	public ArrayList<Suggest> selectList(Connection con, String suggestReciver) {
		ArrayList<Suggest> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from suggest where suggest_recive = ? order by suggest_no desc";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suggestReciver);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				list = new ArrayList<Suggest>();
				
				while(rset.next()){
					Suggest suggest = new Suggest();
					
					suggest.setSuggestNo(rset.getInt("suggest_no"));
					suggest.setSuggestTitle(rset.getString("suggest_title"));
					suggest.setSuggestPreoid(rset.getString("suggest_request_preoid"));
					suggest.setSuggestContent(rset.getString("suggest_content"));
					suggest.setSuggestDate(rset.getDate("suggest_date"));
					suggest.setSuggestOriginalFileName(rset.getString("suggest_original_filename"));
					suggest.setSuggestRenameFileName(rset.getString("suggest_rename_filename"));
					suggest.setSuggestWriter(rset.getString("suggest_writer"));
					suggest.setSuggestReciver(rset.getString("suggest_recive"));
					
					list.add(suggest);
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

	public int deleteSuggest(Connection con, int no) {
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "delete from suggest where suggest_no = ?";
		
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

	public Suggest selectOne(Connection con, int no) {
		Suggest suggest = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from suggest where suggest_no = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setInt(1, no);
			
			rset = pstmt.executeQuery();
			
			if(rset.next()){
				suggest = new Suggest();
				
				suggest.setSuggestNo(rset.getInt("suggest_no"));
				suggest.setSuggestTitle(rset.getString("suggest_title"));
				suggest.setSuggestPreoid(rset.getString("suggest_request_preoid"));
				suggest.setSuggestContent(rset.getString("suggest_content"));
				suggest.setSuggestDate(rset.getDate("suggest_date"));
				suggest.setSuggestOriginalFileName(rset.getString("suggest_original_filename"));
				suggest.setSuggestRenameFileName(rset.getString("suggest_rename_filename"));
				suggest.setSuggestWriter(rset.getString("suggest_writer"));
				suggest.setSuggestReciver(rset.getString("suggest_recive"));
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return suggest;
	}

	public int sendSuggest(Connection con, Suggest suggest) {
		//쪽지 보내기
		int result = 0;
		PreparedStatement pstmt = null;
		
		String query = "insert into suggest values ((select max(suggest_no) + 1 from suggest), ?, ?, ?, default, ?, ?, ?, ?)";
						//+ "select from suggest where suggest_recive = ?";
						//where = ?(수신자 아이디)
		try {
			pstmt = con.prepareStatement(query);
			
			pstmt.setString(1, suggest.getSuggestTitle());
			pstmt.setString(2, suggest.getSuggestPreoid());
			pstmt.setString(3, suggest.getSuggestContent());
			pstmt.setString(4, suggest.getSuggestOriginalFileName());
			pstmt.setString(5, suggest.getSuggestRenameFileName());
			pstmt.setString(6, suggest.getSuggestWriter());
			pstmt.setString(7, suggest.getSuggestReciver());
			
			
			result = pstmt.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}		
		
		return result;
	}

	
	public Boolean idconfirmSuggest(Connection con, String suggestReciver) {
		//수신자 아이디 확인
		//Member member = null;
		Boolean result = false;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		
		String query = "select * from member where member_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, suggestReciver);
			
			rset = pstmt.executeQuery();
			
			if(rset != null){
				result=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		
		return result;
	}

}
