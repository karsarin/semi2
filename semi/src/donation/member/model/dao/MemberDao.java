package donation.member.model.dao;

import static donation.common.JDBCTemplate.*;

import java.sql.*;
import java.util.ArrayList;

import org.apache.tomcat.util.net.jsse.NioX509KeyManager;

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
				member.setMemberDate(rset.getDate("signup_date"));
				member.setConnection(rset.getString("connection"));
				member.setTalent(rset.getString("talent"));
				member.setMgrChat(rset.getString("mgrchat"));
				member.setMgrLogin(rset.getString("mgrlogin"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
			
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
	public int memberInsertCheck(Connection con, Member member, String memberPwd2){
		
		int result = 0;



		if(!(member.getMemberId().length() >= 8 && member.getMemberId().length() <= 15)){
			 return 1;//아이디 길이 오류
		}
		int num = 0;
		int spal = 0;
		for(int i=0;i<member.getMemberId().length();i++){
			if(!((member.getMemberId().charAt(i) >= 'a'&&member.getMemberId().charAt(i) <= 'z')||(member.getMemberId().charAt(i) >= 'a'&&member.getMemberId().charAt(i) <= 'z')||(member.getMemberId().charAt(i) >= '0'&&member.getMemberId().charAt(i) <= '9'))){
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
		if(!(member.getMemberPwd().equals(memberPwd2))){
			return 4;// 비밀먼호 확인 실패
		}
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<Member> list = null;
		String query = "select * from member";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset !=null){
				list = new ArrayList<Member>();
				while(rset.next()){
					Member m = new Member();
					m.setMemberNo(rset.getString("member_no"));
					m.setMemberPhone(rset.getString("member_phone"));
					list.add(m);
				}
				
				
			}
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		for(Member mem : list){
			if(member.getMemberNo() == mem.getMemberNo()){
				return 5;//주민번호 중복체크 
			}
		}
		for(Member mem : list){
			if(member.getMemberEmail() == mem.getMemberEmail()){
				return 6;//이메일 중복체크 
			}
		}
		for(Member mem : list){
			if(member.getMemberPhone() == mem.getMemberPhone()){
				return 7;//전화번호 중복체크 
			}
		}
		return result;
	}
	public int memberIdCheck(Connection con,Member member){
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
					list.add(m);
				}
				
				
			}
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		for(Member mem : list){
			if(member.getMemberId() == mem.getMemberId()){
				return 1; //아이디 중복체크
			}
		}
		return result;
	}
	public int memberNikCheck(Connection con,Member member){
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
					m.setMemberNik(rset.getString("member_nik"));
					
					list.add(m);
				}
				
				
			}
			} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		for(Member mem : list){
			if(member.getMemberNik() == mem.getMemberNik()){
				return 1;//닉네임 중복체크 
			}
		}
		return result;
	}
	public Member memberInformation(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member member = null;
		String query = "select * from member where member_id = ?";
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()){
			member = new Member();
			member.setMemberId(memberId);
			member.setMemberPwd(rset.getString("member_pwd"));
			member.setMemberName(rset.getString("member_name"));
			member.setMemberNo(rset.getString("member_no"));
			member.setMemberNik(rset.getString("member_nik"));
			member.setMemberAddress(rset.getString("member_address"));
			member.setMemberEmail(rset.getString("member_email"));
			member.setMemberPhone(rset.getString("member_phone"));
			member.setMemberDate(rset.getDate("signup_date"));
			member.setConnection(rset.getString("connection"));
			member.setTalent(rset.getString("talent"));
			member.setMgrChat(rset.getString("manager_chatting"));
			member.setMgrLogin(rset.getString("manager_login"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
		}
		return member;
	}

	public int updateMember(Connection con, Member member, Member memberOrigin) {
		int result = 0;
		PreparedStatement pstmt = null;
		System.out.println(member);
		System.out.println(memberOrigin);
		String query = "update member set member_pwd=?,member_name=?,member_nik=?,member_address=?,member_email=?,member_phone=?,talent=? where member_id=?";
		try {
			pstmt = con.prepareStatement(query);
			if(member.getMemberPwd()!=null&&member.getMemberPwd()!="")
				pstmt.setString(1, member.getMemberPwd());
			else
				pstmt.setString(1, memberOrigin.getMemberPwd());
			if(member.getMemberName() != null&&member.getMemberName()!="")
				pstmt.setString(2, member.getMemberName());
			else
				pstmt.setString(2, memberOrigin.getMemberName());
			if(member.getMemberNik() !=null&&member.getMemberNik()!="")
				pstmt.setString(3, member.getMemberNik());
			else
				pstmt.setString(3, memberOrigin.getMemberNik());
			if(member.getMemberAddress() !=null&&member.getMemberAddress()!="")
				pstmt.setString(4, member.getMemberAddress());
			else
				pstmt.setString(4, memberOrigin.getMemberAddress());
			if(member.getMemberEmail() !=null&&member.getMemberEmail()!="")
				pstmt.setString(5, member.getMemberEmail());
			else
				pstmt.setString(5, memberOrigin.getMemberEmail());
			if(member.getMemberPhone() !=null&&member.getMemberPhone()!="")
				pstmt.setString(6, member.getMemberPhone());
			else
				pstmt.setString(6, memberOrigin.getMemberPhone());
			pstmt.setString(7, member.getTalent());
			pstmt.setString(8, member.getMemberId());
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		return result;
	}

	public Member selectMember(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		ResultSet  rset = null;
		
		String query = "select * from member where member_id = ?";
		
		Member member=null;
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			rset = pstmt.executeQuery();
			if(rset.next()){
				member = new Member();
				member.setMemberId(memberId);
				member.setMemberPwd(rset.getString("member_pwd"));
				member.setMemberName(rset.getString("member_name"));
				member.setMemberNo(rset.getString("member_no"));
				member.setMemberNik(rset.getString("member_nik"));
				member.setMemberAddress(rset.getString("member_address"));
				member.setMemberEmail(rset.getString("member_email"));
				member.setMemberPhone(rset.getString("member_phone"));
				member.setMemberDate(rset.getDate("signup_date"));
				member.setConnection(rset.getString("connection"));
				member.setTalent(rset.getString("talent"));
				member.setMgrChat(rset.getString("manager_chatting"));
				member.setMgrLogin(rset.getString("manager_login"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(pstmt);
			
		}
		return member;
	}

	public int deleteMember(Connection con, String memberId) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from member where member_id = ?";
		
		try {
			pstmt = con.prepareStatement(query);
			pstmt.setString(1, memberId);
			
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(pstmt);
		}
		System.out.println(result);
		return result;
	}

	public int selectMemberNum(Connection con) {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		
		String query = "select count(*) from member";
		try {
			stmt = con.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()){
				result = rset.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			close(rset);
			close(stmt);
		}
		return result;
	}
}
