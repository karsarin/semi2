package donation.member.model.dao;

import static donation.common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import donation.member.model.vo.Member;

public class MemberDao {

	public Member selectMember(Connection con, String memberId, String memberPwd) {
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		
		String query = "select * from member where member_id = ? and member_pwd = ?";
		
		Member member=null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			pstmt.setString(2, memberPwd);
			rset = pstmt.executeQuery();
			if(rset.next()){
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(memberPwd);
				member.setMemberName(rset.getString("member_name"));
				member.setMemberNo(rset.getString("member_no"));
				member.setMemberNik(rset.getString("member_nik"));
				member.setMemberAddress(rset.getString("member_address"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberDate(rset.getDate("member_date"));
				member.setConnection(rset.getString("connection"));
				member.setTalent(rset.getString("talent"));
				member.setMgrChat(rset.getString("manager_chatting"));
				member.setMgrLogin(rset.getString("manager_login"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			
			close(pstmt);
			close(rset);
		}
		return member;
	}

	public int memberInsert(Connection con, Member member) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = "insert into member values(?,?,?,?,?,?,?,?,default,default,?,default,default)";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, member.getMemberId());
			pstmt.setString(2, member.getMemberPwd());
			pstmt.setString(3, member.getMemberName());
			pstmt.setString(4, member.getMemberNo());
			pstmt.setString(5, member.getMemberNik());
			pstmt.setString(6, member.getMemberAddress());
			pstmt.setString(7, member.getMemberEmail());
			pstmt.setString(8, member.getMemberPhone());
			pstmt.setString(9, member.getTalent());
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}
	public int memberInsertCheck(Member member, String memberPwd2){
		
		int result = 0;



		if(member.getMemberId().length() >= 8 && member.getMemberId().length() <= 15){
			 return 1;//아이디 길이 오류
		}
		int num = 0;
		int spal = 0;
		for(int i=0;i<member.getMemberId().length();i++){
			if(!(member.getMemberId().toUpperCase().charAt(i)>='A'&&member.getMemberId().toUpperCase().charAt(i)<='Z')|| !(member.getMemberId().charAt(i)>='0'&& member.getMemberId().charAt(i)<='9')){
				return 2;//아이디 영문숫자 오류
			}else if(!(member.getMemberId().toUpperCase().charAt(i)>='A'&&member.getMemberId().toUpperCase().charAt(i)<='Z')){
				num +=1;
			}else{
				spal +=1;
			}
		}
		if(member.getMemberId().length() == num || member.getMemberId().length()==spal){
			return 3;//아이디 영문숫자조합 오류
		}
		if(!(member.getMemberPwd() == memberPwd2)){
			return 4;// 비밀먼호 확인 실패
		}
		
		return result;
	}
	public int memberEqualsCheck(Connection con,Member member){
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		String query = "select * from member";
		int result = 0;
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset !=null){
				list = new ArrayList<Member>();
				while(rset.next()){
					Member m = new Member();
					m.setMemberId(rset.getString("member_id"));
					m.setMemberPwd(rset.getString("member_pwd"));
					m.setMemberName(rset.getString("member_name"));
					m.setMemberNo(rset.getString("member_no"));
					m.setMemberNik(rset.getString("member_nik"));
					m.setMemberAddress(rset.getString("member_address"));
					m.setMemberEmail(rset.getString("member_email"));
					m.setMemberPhone(rset.getString("member_phone"));
					m.setMemberDate(rset.getDate("member_date"));
					m.setConnection(rset.getString("connection"));
					m.setTalent(rset.getString("talent"));
					m.setMgrChat(rset.getString("manager_chatting"));
					m.setMgrLogin(rset.getString("manager_login"));
					
					list.add(m);
				}
				
				
			}
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(stmt);
		}
		for(Member mem : list){
			if(member.getMemberId() == mem.getMemberId()){
				return 1; //아이디 중복체크
			}
		}
		for(Member mem : list){
			if(member.getMemberNik() == mem.getMemberNik()){
				return 1;//닉네임 중복체크 
			}
		}
		return result;
	}
}
