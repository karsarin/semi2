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
	private String addImage1;
	private String addRenameImage1;
	private String addImage2;
	private String addRenameImage2;
	private String addImage3;
	private String addRenameImage3;
	private String addImage4;
	private String addRenameImage4;
	private String special;
	private String approval;
	private int purchaseCount;
	private int verdict;
	
	public Category(){}
// 디비 수정된거에 맞게 vo 수정
	public Category(int categoryNo, String userId, int categoryGroup, String categoryTitle, String categoryWriter,
			String categoryContent, Date categoryDate, int categoryReadcount, int categoryDonation, int workDate,
			int categoryLevel, int categoryRef, int categoryReplyRef, int categoryReplySeq, String phone, String email,
			String originalImage, String renameImage, String addImage1, String addRenameImage1, String addImage2, String addRenameImage2, 
			String addImage3, String addRenameImage3, String addImage4, String addRenameImage4,
			String special, String approval, int purchaseCount, int verdict) {
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
		this.addImage1 = addImage1;
		this.addRenameImage1 = addRenameImage1;
		this.addImage2 = addImage2;
		this.addRenameImage2 = addRenameImage2;
		this.addImage3 = addImage3;
		this.addRenameImage3 = addRenameImage3;
		this.addImage4 = addImage4;
		this.addRenameImage4 = addRenameImage4;		
		this.special = special;
		this.approval = approval;
		this.verdict = verdict;
		this.purchaseCount = purchaseCount;
	}

	public Category(String userId, String categoryTitle, int categoryGroup, String categoryWriter, String categoryContent, int categoryDonation, 
			int workDate, String email, String phone, String addImage1, String addRenameImage1, String addImage2, String addRenameImage2, 
			String addImage3, String addRenameImage3, String addImage4, String addRenameImage4, String originalImage, String renameImage)
	{
		this.userId = userId;
		this.categoryTitle = categoryTitle;
		this.categoryGroup = categoryGroup;
		this.categoryWriter = categoryWriter;
		this.categoryContent = categoryContent;
		this.categoryDonation = categoryDonation;
		this.workDate = workDate;
		this.email = email;
		this.phone = phone;
		
		this.originalImage = originalImage;
		this.renameImage = renameImage;
		
		this.addImage1 = addImage1;
		this.addRenameImage1 = addRenameImage1;
		this.addImage2 = addImage2;
		this.addRenameImage2 = addRenameImage2;
		this.addImage3 = addImage3;
		this.addRenameImage3 = addRenameImage3;
		this.addImage4 = addImage4;
		this.addRenameImage4 = addRenameImage4;
		
		
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
	
	public int getPurchaseCount() {
		return purchaseCount;
	}
	
	public int getVerdict() {
		return verdict;
	}
	
	public void setPurchaseCount(int purchaseCount) {
		this.purchaseCount = purchaseCount;
	}
	
	public void setVerdict(int verdict) {
		this.verdict = verdict;
	}
	public String getAddImage1() {
		return addImage1;
	}
	public String getAddRenameImage1() {
		return addRenameImage1;
	}
	public String getAddImage2() {
		return addImage2;
	}
	public String getAddRenameImage2() {
		return addRenameImage2;
	}
	public String getAddImage3() {
		return addImage3;
	}
	public String getAddRenameImage3() {
		return addRenameImage3;
	}
	public String getAddImage4() {
		return addImage4;
	}
	public String getAddRenameImage4() {
		return addRenameImage4;
	}
	public void setAddImage1(String addImage1) {
		this.addImage1 = addImage1;
	}
	public void setAddRenameImage1(String addRenameImage1) {
		this.addRenameImage1 = addRenameImage1;
	}
	public void setAddImage2(String addImage2) {
		this.addImage2 = addImage2;
	}
	public void setAddRenameImage2(String addRenameImage2) {
		this.addRenameImage2 = addRenameImage2;
	}
	public void setAddImage3(String addImage3) {
		this.addImage3 = addImage3;
	}
	public void setAddRenameImage3(String addRenameImage3) {
		this.addRenameImage3 = addRenameImage3;
	}
	public void setAddImage4(String addImage4) {
		this.addImage4 = addImage4;
	}
	public void setAddRenameImage4(String addRenameImage4) {
		this.addRenameImage4 = addRenameImage4;
	}	
	
}
