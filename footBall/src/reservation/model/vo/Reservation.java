package reservation.model.vo;

import java.sql.Date;

public class Reservation {
	private int resNo;
	private int resBCode;
	private int resCCode;
	private String resMEmail;
	private String resMPhone;
	private Date resDate;
	private String resTime;
	private int resRentalNo;
	private int resTotalCost;
	private Date resOrderDate;
	private String resPaymentId;
	private String resPaymentNum;
	private String resPaymentDate;
	private int resPayment;
	private int resCancel;
	public Reservation() {
		super();
	}
	public Reservation(int resNo, int resBCode, int resCCode, String resMEmail, String resMPhone, Date resDate,
			String resTime, int resRentalNo, int resTotalCost, Date resOrderDate, String resPaymentId,
			String resPaymentNum, String resPaymentDate, int resPayment, int resCancel) {
		super();
		this.resNo = resNo;
		this.resBCode = resBCode;
		this.resCCode = resCCode;
		this.resMEmail = resMEmail;
		this.resMPhone = resMPhone;
		this.resDate = resDate;
		this.resTime = resTime;
		this.resRentalNo = resRentalNo;
		this.resTotalCost = resTotalCost;
		this.resOrderDate = resOrderDate;
		this.resPaymentId = resPaymentId;
		this.resPaymentNum = resPaymentNum;
		this.resPaymentDate = resPaymentDate;
		this.resPayment = resPayment;
		this.resCancel = resCancel;
	}
	public int getResNo() {
		return resNo;
	}
	public void setResNo(int resNo) {
		this.resNo = resNo;
	}
	public int getResBCode() {
		return resBCode;
	}
	public void setResBCode(int resBCode) {
		this.resBCode = resBCode;
	}
	public int getResCCode() {
		return resCCode;
	}
	public void setResCCode(int resCCode) {
		this.resCCode = resCCode;
	}
	public String getResMEmail() {
		return resMEmail;
	}
	public void setResMEmail(String resMEmail) {
		this.resMEmail = resMEmail;
	}
	public String getResMPhone() {
		return resMPhone;
	}
	public void setResMPhone(String resMPhone) {
		this.resMPhone = resMPhone;
	}
	public Date getResDate() {
		return resDate;
	}
	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}
	public String getResTime() {
		return resTime;
	}
	public void setResTime(String resTime) {
		this.resTime = resTime;
	}
	public int getResRentalNo() {
		return resRentalNo;
	}
	public void setResRentalNo(int resRentalNo) {
		this.resRentalNo = resRentalNo;
	}
	public int getResTotalCost() {
		return resTotalCost;
	}
	public void setResTotalCost(int resTotalCost) {
		this.resTotalCost = resTotalCost;
	}
	public Date getResOrderDate() {
		return resOrderDate;
	}
	public void setResOrderDate(Date resOrderDate) {
		this.resOrderDate = resOrderDate;
	}
	public String getResPaymentId() {
		return resPaymentId;
	}
	public void setResPaymentId(String resPaymentId) {
		this.resPaymentId = resPaymentId;
	}
	public String getResPaymentNum() {
		return resPaymentNum;
	}
	public void setResPaymentNum(String resPaymentNum) {
		this.resPaymentNum = resPaymentNum;
	}
	public String getResPaymentDate() {
		return resPaymentDate;
	}
	public void setResPaymentDate(String resPaymentDate) {
		this.resPaymentDate = resPaymentDate;
	}
	public int getResPayment() {
		return resPayment;
	}
	public void setResPayment(int resPayment) {
		this.resPayment = resPayment;
	}
	public int getResCancel() {
		return resCancel;
	}
	public void setResCancel(int resCancel) {
		this.resCancel = resCancel;
	}

}
