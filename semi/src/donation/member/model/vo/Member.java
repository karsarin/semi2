package donation.member.model.vo;

import java.sql.Date;

public class Member {
	private String memberId;
	private String memberPwd;
	private String memberName;
	private String memberNo;
	private String memberNik;
	private String memberAddress;
	private String memberEmail;
	private String memberPhone;
	private Date memberDate;
	private String connection;
	private String talent;
	private String mgrChat;
	private String mgrLogin;
	public Member() {
		super();
	}
	public Member(String memberId, String memberPwd, String memberName, String memberNo, String memberNik,
			String memberAddress, String memberEmail, String memberPhone, Date memberDate, String connection, String talent, String mgrChat, String mgrLogin) {
		super();
		this.memberId = memberId;
		this.memberPwd = memberPwd;
		this.memberName = memberName;
		this.memberNo = memberNo;
		this.memberNik = memberNik;
		this.memberAddress = memberAddress;
		this.memberEmail = memberEmail;
		this.memberPhone = memberPhone;
		this.memberDate = memberDate;
		this.connection = connection;
		this.talent = talent;
		this.mgrChat = mgrChat;
		this.mgrLogin = mgrLogin;
	}
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberNo() {
		return memberNo;
	}
	public void setMemberNo(String memberNo) {
		this.memberNo = memberNo;
	}
	public String getMemberNik() {
		return memberNik;
	}
	public void setMemberNik(String memberNik) {
		this.memberNik = memberNik;
	}
	public String getMemberAddress() {
		return memberAddress;
	}
	public void setMemberAddress(String memberAddress) {
		this.memberAddress = memberAddress;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public String getMemberPhone() {
		return memberPhone;
	}
	public void setMemberPhone(String memberPhone) {
		this.memberPhone = memberPhone;
	}
	public Date getMemberDate() {
		return memberDate;
	}
	public void setMemberDate(Date memberDate) {
		this.memberDate = memberDate;
	}
	public String getConnection() {
		return connection;
	}
	public void setConnection(String connection) {
		this.connection = connection;
	}	
	public String getMgrChat() {
		return mgrChat;
	}
	public void setMgrChat(String mgrChat) {
		this.mgrChat = mgrChat;
	}
	public String getMgrLogin() {
		return mgrLogin;
	}
	public void setMgrLogin(String mgrLogin) {
		this.mgrLogin = mgrLogin;
	}
	public String getTalent() {
		return talent;
	}
	public void setTalent(String talent) {
		this.talent = talent;
	}
	@Override
	 public String toString(){
		 return this.getMemberId() + "," + this.getMemberPwd() + "," + this.getMemberName() + ","
				 + this.getMemberNo() + "," + this.getMemberNik() +"," + this.getMemberAddress() +  "," 
				 + this.getMemberEmail() + "," + this.getMemberPhone() + "," + this.getMemberDate() +","
				 + this.getConnection() + "," + this.talent + "," + this.mgrChat + "," + this.mgrLogin;
	 }
	
}
