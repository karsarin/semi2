package donation.question.model.vo;
import java.sql.Date;

public class Question implements java.io.Serializable {
	private static final long serialVersionUID = 10002L;
	
	public int questionNum;
	private String questionTitle;
	private String questionWriter;
	private String questionContent;
	private String questionOriginalFileName;
	private String questionRenameFileName;
	private Date questionDate;
	private int questionReadCount;
	private int questionLevel;
	private int questionRef;
	private int questionReplyRef;
	private int questionReplySeq;
	
	
	///////////////////////////////////////////////////////
	
	
	public Question(){}

	public Question(int questionNum, String questionTitle, String questionWriter, String questionContent, String questionOriginalFileName,
			String questionRenameFileName, Date questionDate, int questionReadCount, int questionLevel, int questionRef,
			int questionReplyRef, int questionReplySeq) {
		super();
		this.questionNum = questionNum;
		this.questionTitle = questionTitle;
		this.questionWriter = questionWriter;
		this.questionContent = questionContent;
		this.questionOriginalFileName = questionOriginalFileName;
		this.questionRenameFileName = questionRenameFileName;
		this.questionDate = questionDate;
		this.questionReadCount = questionReadCount;
		this.questionLevel = questionLevel;
		this.questionRef = questionRef;
		this.questionReplyRef = questionReplyRef;
		this.questionReplySeq = questionReplySeq;
	}

	public Question(int questionNum, String questionTitle, String questionContent) {
		super();
		this.questionNum = questionNum;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
	}

	public Question(int questionNum, String questionTitle, String questionWriter, String questionContent) {
		super();
		this.questionNum = questionNum;
		this.questionTitle = questionTitle;
		this.questionWriter = questionWriter;
		this.questionContent = questionContent;
	}

	public Question(String questionTitle, String questionWriter, String questionContent, String questionOriginalFileName,
			String questionRenameFileName) {
		super();
		this.questionTitle = questionTitle;
		this.questionWriter = questionWriter;
		this.questionContent = questionContent;
		this.questionOriginalFileName = questionOriginalFileName;
		this.questionRenameFileName = questionRenameFileName;
	}

	public Question(int questionNum, String questionTitle, String questionContent, String questionOriginalFileName,
			String questionRenameFileName) {
		super();
		this.questionNum = questionNum;
		this.questionTitle = questionTitle;
		this.questionContent = questionContent;
		this.questionOriginalFileName = questionOriginalFileName;
		this.questionRenameFileName = questionRenameFileName;
	}
	////////////////////////////////////////////////////

	public int getQuestionNum() {
		return questionNum;
	}

	public void setQuestionNum(int questionNum) {
		this.questionNum = questionNum;
	}

	public String getQuestionTitle() {
		return questionTitle;
	}

	public void setQuestionTitle(String questionTitle) {
		this.questionTitle = questionTitle;
	}

	public String getQuestionWriter() {
		return questionWriter;
	}

	public void setQuestionWriter(String questionWriter) {
		this.questionWriter = questionWriter;
	}

	public String getQuestionContent() {
		return questionContent;
	}

	public void setQuestionContent(String questionContent) {
		this.questionContent = questionContent;
	}

	public String getQuestionOriginalFileName() {
		return questionOriginalFileName;
	}

	public void setQuestionOriginalFileName(String questionOriginalFileName) {
		this.questionOriginalFileName = questionOriginalFileName;
	}

	public String getQuestionRenameFileName() {
		return questionRenameFileName;
	}

	public void setQuestionRenameFileName(String questionRenameFileName) {
		this.questionRenameFileName = questionRenameFileName;
	}

	public Date getQuestionDate() {
		return questionDate;
	}

	public void setQuestionDate(Date questionDate) {
		this.questionDate = questionDate;
	}

	public int getQuestionReadCount() {
		return questionReadCount;
	}

	public void setQuestionReadCount(int questionReadCount) {
		this.questionReadCount = questionReadCount;
	}

	public int getQuestionLevel() {
		return questionLevel;
	}

	public void setQuestionLevel(int questionLevel) {
		this.questionLevel = questionLevel;
	}

	public int getQuestionRef() {
		return questionRef;
	}

	public void setQuestionRef(int questionRef) {
		this.questionRef = questionRef;
	}

	public int getQuestionReplyRef() {
		return questionReplyRef;
	}

	public void setQuestionReplyRef(int questionReplyRef) {
		this.questionReplyRef = questionReplyRef;
	}

	public int getQuestionReplySeq() {
		return questionReplySeq;
	}

	public void setQuestionReplySeq(int questionReplySeq) {
		this.questionReplySeq = questionReplySeq;
	}

	/////////////////////////////
	@Override
	public String toString(){
		return this.questionNum + ", " + this.questionTitle + ", "  + this.questionWriter 
				+ ", " + this.questionContent + ", " + this.questionDate + ", " 
				+ this.questionReadCount + ", " + this.questionOriginalFileName + ", " + this.questionRenameFileName 
				+ this.questionLevel + ", " + this.questionRef + ", " + this.questionReplyRef + ", " + this.questionReplySeq;
	}

}
