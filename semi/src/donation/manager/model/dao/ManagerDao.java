package donation.manager.model.dao;

import static donation.common.JDBCTemplate.close;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import donation.category.vo.Category;
import donation.member.model.vo.Member;
import donation.question.model.vo.Question;

public class ManagerDao {
	public ManagerDao(){}

	public ArrayList<Member> selectAllMember(Connection conn) {
		ArrayList<Member> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from member";
		
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset!=null) {
				list = new ArrayList<Member>();
				while(rset.next()) {
					Member member = new Member(
							rset.getString("member_id"), rset.getString("member_pwd"), rset.getString("member_name"),
							rset.getString("member_no"), rset.getString("member_nik"), rset.getString("member_address"),
							rset.getString("member_email"), rset.getString("member_phone"), rset.getDate("signup_date"),
							rset.getString("connection"), rset.getString("talent"), rset.getString("mgrchat"), rset.getString("mgrlogin")
					);
					list.add(member);
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

	public Member selectMember(Connection conn, String memberId) {
		Member member = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from member where member_id = ?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				member = new Member(
						rset.getString("member_id"), rset.getString("member_pwd"), rset.getString("member_name"),
						rset.getString("member_no"), rset.getString("member_nik"), rset.getString("member_address"),
						rset.getString("member_email"), rset.getString("member_phone"), rset.getDate("signup_date"),
						rset.getString("connection"), rset.getString("talent"), rset.getString("mgrchat"), rset.getString("mgrlogin")
				);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updateMember(Connection conn, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "update member set mgrchat=?, mgrlogin=? "
					 + "where member_id=?";
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, member.getMgrChat());
			pstmt.setString(2, member.getMgrLogin());
			pstmt.setString(3, member.getMemberId());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(pstmt);
		}
		return result;
	}

	public int getCategoryListCount(Connection conn) {
		int clistCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from category_board where approval='N'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				clistCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return clistCount;
	}

	public ArrayList<Category> selectCategoryList(Connection conn, int ccurrentPage, int climit) {
		ArrayList<Category> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from("
					 + "select rownum rnum, category_no, user_Id, category_group, category_title, "
					 + "category_writer, category_content, category_date, category_readcount, category_donation,"
					 + "work_date, category_level, category_ref, category_reply_ref, category_reply_seq, "
					 + "phone, email, original_image, rename_image, "
					 + "add_image1, add_image2, add_image3, add_image4, "
					 + "add_rename_image1, add_rename_image2, add_rename_image3, add_rename_image4, "
					 + "special, approval from category_board)"
					 + "where approval=? and rnum>=? and rnum<=?";
		int startRow = (ccurrentPage-1)*climit+1;
		int endRow = startRow+climit-1;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "N");
			pstmt.setInt(2, startRow);
			pstmt.setInt(3, endRow);
			rset = pstmt.executeQuery();
			if(rset!=null) {
				list = new ArrayList<Category>();
				while(rset.next()) {
					Category category = new Category(
							rset.getInt("category_no"), rset.getString("user_Id"), rset.getInt("category_group"), rset.getString("category_title"),
							rset.getString("category_writer"), rset.getString("category_content"), rset.getDate("category_date"), 
							rset.getInt("category_readcount"), rset.getInt("category_donation"), rset.getInt("work_date"), 							
							rset.getInt("category_level"), rset.getInt("category_ref"), rset.getInt("category_reply_ref"), rset.getInt("category_reply_seq"),
							rset.getString("phone"), rset.getString("email"), 
							rset.getString("original_image"), rset.getString("rename_image"), 
							rset.getString("add_image1"), rset.getString("add_rename_image1"), rset.getString("add_image2"), rset.getString("add_rename_image2"),
							rset.getString("add_image3"), rset.getString("add_rename_image3"), rset.getString("add_image4"), rset.getString("add_rename_image4"),
							rset.getString("special"), rset.getString("approval")
					);
					list.add(category);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}

	public int getQnAListCount(Connection conn) {
		int qlistCount = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select count(*) from question where answer='N'";
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				qlistCount = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(stmt);
		}
		return qlistCount;
	}

	public ArrayList<Question> selectQnAList(Connection conn) {
		ArrayList<Question> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = "select * from question "
					 + "where ANSWER=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "N");
			rset = pstmt.executeQuery();
			if(rset!=null) {
				list = new ArrayList<Question>();
				while(rset.next()) {
					Question question = new Question(
						rset.getInt("QUESTION_NUM"), rset.getString("QUESTION_TITLE"), rset.getString("QUESTION_WRITER"), 
						rset.getString("QUESTION_CONTENT"), rset.getString("QUESTION_ORIGINAL_FILENAME"),
						rset.getString("QUESTION_RENAME_FILENAME"), rset.getDate("QUESTION_DATE"), rset.getInt("QUESTION_READCOUNT"),
						rset.getInt("QUESTION_LEVEL"), rset.getInt("QUESTION_REF"), rset.getInt("QUESTION_REPLY_REF"), rset.getInt("QUESTION_REPLY_SEQ")
					);
					list.add(question);
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			close(rset);
			close(pstmt);
		}
		return list;
	}
}
