package donation.donate.model.vo;

import java.sql.Date;

public class Donate {
	private int donationNo;
	private String memberId;
	private int donation;
	private Date donationDate;
	
	public Donate() {
		super();
	}

	public Donate(int donationNo, String memberId, int donation, Date donationDate) {
		super();
		this.donationNo = donationNo;
		this.memberId = memberId;
		this.donation = donation;
		this.donationDate = donationDate;
	}

	public int getDonationNo() {
		return donationNo;
	}

	public void setDonationNo(int donationNo) {
		this.donationNo = donationNo;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public int getDonation() {
		return donation;
	}

	public void setDonation(int donation) {
		this.donation = donation;
	}

	public Date getDonationDate() {
		return donationDate;
	}

	public void setDonationDate(Date donationDate) {
		this.donationDate = donationDate;
	}
	@Override
	public String toString(){
		return this.donationNo + "," + this.memberId + "," + this.donation + "," + this.donationDate;
	}
}
