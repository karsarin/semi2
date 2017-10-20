package donation.search.model.vo;

import java.sql.*;

public class Notice implements java.io.Serializable{
	int categoryNo;
	String userId;
	String categoryGroup;
	String categoryTitle;
	String categoryWriter;
	String categoryContent;
	Date categoryDate;
	int categoryReadcount;
	int categoryDonation;
	int workDate;
	int categoryLevel;
	int categoryRef;
	int categoryReplyRef;
	int categoryReplySeq;
	String phone;
	String email;
	String originalImage;
	String renameImage;
	String special;
	String approval;
	
	public Notice(){
		
	}

	public Notice(int categoryNo, String userId, String categoryGroup, String categoryTitle, String categoryWriter,
			String categoryContent, Date categoryDate, int categoryReadcount, int categoryDonation, int workDate,
			int categoryLevel, int categoryRef, int categoryReplyRef, int categoryReplySeq, String phone, String email,
			String originalImage, String renameImage, String secial, String approval) {
		super();
		this.categoryNo = categoryNo;
		this.userId = userId;
		this.categoryGroup = categoryGroup;
		this.categoryTitle = categoryTitle;
		this.categoryWriter = categoryWriter;
		this.categoryContent = categoryContent;
		this.categoryDate = categoryDate;
		this.categoryReadcount = categoryReadcount;
		this.categoryDonation = categoryDonation;
		this.workDate = workDate;
		this.categoryLevel = categoryLevel;
		this.categoryRef = categoryRef;
		this.categoryReplyRef = categoryReplyRef;
		this.categoryReplySeq = categoryReplySeq;
		this.phone = phone;
		this.email = email;
		this.originalImage = originalImage;
		this.renameImage = renameImage;
		this.special = secial;
		this.approval = approval;
	}

	public int getCategoryNo() {
		return categoryNo;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getCategoryGroup() {
		return categoryGroup;
	}

	public void setCategoryGroup(String categoryGroup) {
		this.categoryGroup = categoryGroup;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public String getCategoryWriter() {
		return categoryWriter;
	}

	public void setCategoryWriter(String categoryWriter) {
		this.categoryWriter = categoryWriter;
	}

	public String getCategoryContent() {
		return categoryContent;
	}

	public void setCategoryContent(String categoryContent) {
		this.categoryContent = categoryContent;
	}

	public Date getCategoryDate() {
		return categoryDate;
	}

	public void setCategoryDate(Date categoryDate) {
		this.categoryDate = categoryDate;
	}

	public int getCategoryReadcount() {
		return categoryReadcount;
	}

	public void setCategoryReadcount(int categoryReadcount) {
		this.categoryReadcount = categoryReadcount;
	}

	public int getCategoryDonation() {
		return categoryDonation;
	}

	public void setCategoryDonation(int categoryDonation) {
		this.categoryDonation = categoryDonation;
	}

	public int getWorkDate() {
		return workDate;
	}

	public void setWorkDate(int workDate) {
		this.workDate = workDate;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public int getCategoryRef() {
		return categoryRef;
	}

	public void setCategoryRef(int categoryRef) {
		this.categoryRef = categoryRef;
	}

	public int getCategoryReplyRef() {
		return categoryReplyRef;
	}

	public void setCategoryReplyRef(int categoryReplyRef) {
		this.categoryReplyRef = categoryReplyRef;
	}

	public int getCategoryReplySeq() {
		return categoryReplySeq;
	}

	public void setCategoryReplySeq(int categoryReplySeq) {
		this.categoryReplySeq = categoryReplySeq;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getOriginalImage() {
		return originalImage;
	}

	public void setOriginalImage(String originalImage) {
		this.originalImage = originalImage;
	}

	public String getRenameImage() {
		return renameImage;
	}

	public void setRenameImage(String renameImage) {
		this.renameImage = renameImage;
	}

	public String getSpecial() {
		return special;
	}

	public void setSpecial(String secial) {
		this.special = secial;
	}

	public String getApproval() {
		return approval;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}

	@Override
	public String toString() {
		return "Notice [categoryNo=" + categoryNo + ", userId=" + userId + ", categoryGroup=" + categoryGroup
				+ ", categoryTitle=" + categoryTitle + ", categoryWriter=" + categoryWriter + ", categoryContent="
				+ categoryContent + ", categoryDate=" + categoryDate + ", categoryReadcount=" + categoryReadcount
				+ ", categoryDonation=" + categoryDonation + ", workDate=" + workDate + ", categoryLevel="
				+ categoryLevel + ", categoryRef=" + categoryRef + ", categoryReplyRef=" + categoryReplyRef
				+ ", categoryReplySeq=" + categoryReplySeq + ", phone=" + phone + ", email=" + email
				+ ", originalImage=" + originalImage + ", renameImage=" + renameImage + ", secial=" + special
				+ ", approval=" + approval + "]";
	}
	
	
	
	
	
	
	
	
}
