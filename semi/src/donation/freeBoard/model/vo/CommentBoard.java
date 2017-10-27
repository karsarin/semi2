package donation.freeBoard.model.vo;

import java.sql.Date;

public class CommentBoard {
	private int commentNum;
	private int boardNum;
	private String writer;
	private Date date;
	private String date2;
	private String content;
	 
	public CommentBoard() {}
	
	public CommentBoard(int commentNum, int boardNum, String writer, Date date, String content) {
		super();
		this.commentNum = commentNum;
		this.boardNum = boardNum;
		this.writer = writer;
		this.date = date;
		this.content = content;
	}
	public CommentBoard(int boardNum, String writer, String content) {
		super();
		this.boardNum = boardNum;
		this.writer = writer;
		this.content = content;
	}

	public int getCommentNum() {
		return commentNum;
	}
	public void setCommentNum(int commentNum) {
		this.commentNum = commentNum;
	}
	public int getBoardNum() {
		return boardNum;
	}
	public void setBoardNum(int boardNum) {
		this.boardNum = boardNum;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}

	public String getDateString() {
		return this.date2;
	}
	
	public void setDateString(String date2) {
		this.date2 = date2;
	}


}

