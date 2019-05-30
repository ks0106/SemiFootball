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
	private int resRWater;
	private int resRWear;
	private int resRShose;
	private int resTotalCost;
	private int resCancel;
	public Reservation() {
		super();
	}
	public Reservation(int resNo, int resBCode, int resCCode, String resMEmail, String resMPhone, Date resDate,
			String resTime, int resRWater, int resRWear, int resRShose, int resTotalCost, int resCancel) {
		super();
		this.resNo = resNo;
		this.resBCode = resBCode;
		this.resCCode = resCCode;
		this.resMEmail = resMEmail;
		this.resMPhone = resMPhone;
		this.resDate = resDate;
		this.resTime = resTime;
		this.resRWater = resRWater;
		this.resRWear = resRWear;
		this.resRShose = resRShose;
		this.resTotalCost = resTotalCost;
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
	public int getResRWater() {
		return resRWater;
	}
	public void setResRWater(int resRWater) {
		this.resRWater = resRWater;
	}
	public int getResRWear() {
		return resRWear;
	}
	public void setResRWear(int resRWear) {
		this.resRWear = resRWear;
	}
	public int getResRShose() {
		return resRShose;
	}
	public void setResRShose(int resRShose) {
		this.resRShose = resRShose;
	}
	public int getResTotalCost() {
		return resTotalCost;
	}
	public void setResTotalCost(int resTotalCost) {
		this.resTotalCost = resTotalCost;
	}
	public int getResCancel() {
		return resCancel;
	}
	public void setResCancel(int resCancel) {
		this.resCancel = resCancel;
	}
	

}
