package donation.category.vo;

import java.util.Date;

public class Category {
	private int categoryNo;
	private String userId;
	private int categoryGroup;
	private String categoryTitle;
	private String categoryWriter;
	private String categoryContent;
	private Date categoryDate;
	private int categoryReadcount;
	private int categoryDonation;
	private int workDate;
	private int categoryLevel;
	private int categoryRef;
	private int categoryReplyRef;
	private int categoryReplySeq;
	private String phone;
	private String email;
	private String originalImage;
	private String renameImage;
	private String special;
	private String approval;

	public Category(){}

	public Category(int categoryNo, String userId, int categoryGroup, String categoryTitle, String categoryWriter,
			String categoryContent, Date categoryDate, int categoryReadcount, int categoryDonation, int workDate,
			int categoryLevel, int categoryRef, int categoryReplyRef, int categoryReplySeq, String phone, String email,
			String originalImage, String renameImage, String special, String approval) {
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
		this.special = special;
		this.approval = approval;
	}

	public Category(String categoryTitle, String categoryWriter, String categoryContent, String originalImage, String renameFileName)
	{
		this.categoryTitle = categoryTitle;
		this.categoryWriter = categoryWriter;
		this.categoryContent = categoryContent;
		this.originalImage = originalImage;
		this.renameImage = renameImage;
	}
	public int getCategoryNo() {
		return categoryNo;
	}

	public String getUserId() {
		return userId;
	}

	public int getCategoryGroup() {
		return categoryGroup;
	}

	public String getCategoryTitle() {
		return categoryTitle;
	}

	public String getCategoryWriter() {
		return categoryWriter;
	}

	public String getCategoryContent() {
		return categoryContent;
	}

	public Date getCategoryDate() {
		return categoryDate;
	}

	public int getCategoryReadcount() {
		return categoryReadcount;
	}

	public int getCategoryDonation() {
		return categoryDonation;
	}

	public int getWorkDate() {
		return workDate;
	}

	public int getCategoryLevel() {
		return categoryLevel;
	}

	public int getCategoryRef() {
		return categoryRef;
	}

	public int getCategoryReplyRef() {
		return categoryReplyRef;
	}

	public int getCategoryReplySeq() {
		return categoryReplySeq;
	}

	public String getPhone() {
		return phone;
	}

	public String getEmail() {
		return email;
	}

	public String getOriginalImage() {
		return originalImage;
	}

	public String getRenameImage() {
		return renameImage;
	}

	public String getSpecial() {
		return special;
	}

	public String getApproval() {
		return approval;
	}

	public void setCategoryNo(int categoryNo) {
		this.categoryNo = categoryNo;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public void setCategoryGroup(int i) {
		this.categoryGroup = i;
	}

	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}

	public void setCategoryWriter(String categoryWriter) {
		this.categoryWriter = categoryWriter;
	}

	public void setCategoryContent(String categoryContent) {
		this.categoryContent = categoryContent;
	}

	public void setCategoryDate(Date categoryDate) {
		this.categoryDate = categoryDate;
	}

	public void setCategoryReadcount(int categoryReadcount) {
		this.categoryReadcount = categoryReadcount;
	}

	public void setCategoryDonation(int categoryDonation) {
		this.categoryDonation = categoryDonation;
	}

	public void setWorkDate(int workDate) {
		this.workDate = workDate;
	}

	public void setCategoryLevel(int categoryLevel) {
		this.categoryLevel = categoryLevel;
	}

	public void setCategoryRef(int categoryRef) {
		this.categoryRef = categoryRef;
	}

	public void setCategoryReplyRef(int categoryReplyRef) {
		this.categoryReplyRef = categoryReplyRef;
	}

	public void setCategoryReplySeq(int categoryReplySeq) {
		this.categoryReplySeq = categoryReplySeq;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public void setOriginalImage(String originalImage) {
		this.originalImage = originalImage;
	}

	public void setRenameImage(String renameImage) {
		this.renameImage = renameImage;
	}

	public void setSpecial(String special) {
		this.special = special;
	}

	public void setApproval(String approval) {
		this.approval = approval;
	}
	
	
}
