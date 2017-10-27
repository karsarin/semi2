package donation.member.model.vo;

import java.sql.Date;

public class MyWriteList {
	private int listNo;
	private String Kinds;
	private String title;
	private String writer;
	private int count;
	private Date writeDate;
	
	public MyWriteList() {
		super();
	}

	public MyWriteList(int listNo, String kinds, String title, String writer, int count, Date writeDate) {
		super();
		this.listNo = listNo;
		Kinds = kinds;
		this.title = title;
		this.writer = writer;
		this.count = count;
		this.writeDate = writeDate;
	}

	public int getListNo() {
		return listNo;
	}

	public void setListNo(int listNo) {
		this.listNo = listNo;
	}

	public String getKinds() {
		return Kinds;
	}

	public void setKinds(String kinds) {
		Kinds = kinds;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Date getWriteDate() {
		return writeDate;
	}

	public void setWriteDate(Date writeDate) {
		this.writeDate = writeDate;
	}
	@Override
	public String toString(){
		return this.getListNo() + "," + this.getKinds() + "," + this.getTitle()
		+ "," + this.getWriter() + "," + this.getCount() + "," + this.getWriteDate();
	}
	
}
