package donation.suggest.model.vo;

import java.sql.Date;

public class Suggest implements java.io.Serializable{
	private static final long serialVersionUID = 10000L;
	
	private int suggestNo;
	private String suggestTitle;
	private String suggestPreoid;
	private String suggestContent;
	private Date suggestDate;
	private String suggestOriginalFileName;
	private String suggestRenameFileName;
	private String suggestWriter;
	private String suggestReciver;
	
	public Suggest() {
		super();
	}

	public Suggest(int suggestNo, String suggestTitle, String suggestPreoid, String suggestContent, Date suggestDate,
			String suggestOriginalFileName, String suggestRenameFileName, String suggestWriter, String suggestReciver) {
		super();
		this.suggestNo = suggestNo;
		this.suggestTitle = suggestTitle;
		this.suggestPreoid = suggestPreoid;
		this.suggestContent = suggestContent;
		this.suggestDate = suggestDate;
		this.suggestOriginalFileName = suggestOriginalFileName;
		this.suggestRenameFileName = suggestRenameFileName;
		this.suggestWriter = suggestWriter;
		this.suggestReciver = suggestReciver;
	}

	public int getSuggestNo() {
		return suggestNo;
	}

	public void setSuggestNo(int suggestNo) {
		this.suggestNo = suggestNo;
	}

	public String getSuggestTitle() {
		return suggestTitle;
	}

	public void setSuggestTitle(String suggestTitle) {
		this.suggestTitle = suggestTitle;
	}

	public String getSuggestPreoid() {
		return suggestPreoid;
	}

	public void setSuggestPreoid(String suggestPreoid) {
		this.suggestPreoid = suggestPreoid;
	}

	public String getSuggestContent() {
		return suggestContent;
	}

	public void setSuggestContent(String suggestContent) {
		this.suggestContent = suggestContent;
	}

	public Date getSuggestDate() {
		return suggestDate;
	}

	public void setSuggestDate(Date suggestDate) {
		this.suggestDate = suggestDate;
	}

	public String getSuggestOriginalFileName() {
		return suggestOriginalFileName;
	}

	public void setSuggestOriginalFileName(String suggestOriginalFileName) {
		this.suggestOriginalFileName = suggestOriginalFileName;
	}

	public String getSuggestRenameFileName() {
		return suggestRenameFileName;
	}

	public void setSuggestRenameFileName(String suggestRenameFileName) {
		this.suggestRenameFileName = suggestRenameFileName;
	}

	public String getSuggestWriter() {
		return suggestWriter;
	}

	public void setSuggestWriter(String suggestWriter) {
		this.suggestWriter = suggestWriter;
	}

	public String getSuggestReciver() {
		return suggestReciver;
	}

	public void setSuggestReciver(String suggestReciver) {
		this.suggestReciver = suggestReciver;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	
	@Override
	public String toString(){
		return this.suggestNo + ", " + this.suggestTitle + ", " + this.suggestPreoid + ", " +
				this.suggestContent + ", " + this.suggestDate + ", " + this.suggestOriginalFileName + ", " +
				this.suggestRenameFileName + ", " + this.suggestWriter + ", " + this.suggestReciver;
	}
}
