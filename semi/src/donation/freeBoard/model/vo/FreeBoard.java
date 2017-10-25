package donation.freeBoard.model.vo;

import java.sql.Date;

public class FreeBoard implements java.io.Serializable{
	private static final long serialVersionUID = 10001L;
	
	
	
	private int freeBoardNo;
	private String freeBoardTitle;
	private String freeBoardWriter;
	private String freeBoardContent;
	private Date freeBoardDate;
	private String originalFileName;
	private String renameFileName;
	private int readCount;
	
	
	public FreeBoard(){}
	
	
	public FreeBoard(int freeBoardNo, String freeBoardTitle, String freeBoardWriter, String freeBoardContent, Date freeBoardDate,
			String originalFileName, String renameFileName, int readCount) {
		super();
		this.freeBoardNo = freeBoardNo;
		this.freeBoardTitle = freeBoardTitle;
		this.freeBoardWriter = freeBoardWriter;
		this.freeBoardContent = freeBoardContent;
		this.freeBoardDate = freeBoardDate;
		this.originalFileName = originalFileName;
		this.renameFileName = renameFileName;
		this.readCount = readCount;
	}


	public int getfreeBoardNo() {
		return freeBoardNo;
	}
	public void setfreeBoardNo(int freeBoardNo) {
		this.freeBoardNo = freeBoardNo;
	}
	public String getfreeBoardTitle() {
		return freeBoardTitle;
	}
	public void setfreeBoardTitle(String freeBoardTitle) {
		this.freeBoardTitle = freeBoardTitle;
	}
	public String getfreeBoardWriter() {
		return freeBoardWriter;
	}
	public void setfreeBoardWriter(String freeBoardWriter) {
		this.freeBoardWriter = freeBoardWriter;
	}
	public String getfreeBoardContent() {
		return freeBoardContent;
	}
	public void setfreeBoardContent(String freeBoardContent) {
		this.freeBoardContent = freeBoardContent;
	}
	public Date getfreeBoardDate() {
		return freeBoardDate;
	}
	public void setfreeBoardDate(Date freeBoardDate) {
		this.freeBoardDate = freeBoardDate;
	}
	public String getOriginalFileName() {
		return originalFileName;
	}
	public void setOriginalFileName(String originalFileName) {
		this.originalFileName = originalFileName;
	}
	public String getRenameFileName() {
		return renameFileName;
	}
	public void setRenameFileName(String renameFileName) {
		this.renameFileName = renameFileName;
	}
	public int getReadCount() {
		return readCount;
	}
	public void setReadCount(int readCount) {
		this.readCount = readCount;
	}

	
	@Override
	public String toString(){
		return this.freeBoardNo + ", " +  this.freeBoardTitle + ", " + this.freeBoardWriter + ", " +
				this.freeBoardContent + ", " +  this.freeBoardDate + ", " +  this.originalFileName + ", " +  
				this.renameFileName + ", " +  this.readCount;
	}



	
	
	
}
