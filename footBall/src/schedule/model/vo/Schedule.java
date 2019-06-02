package schedule.model.vo;

import java.sql.Date;

public class Schedule {
	private int scheduleNo;
	private int scheduleCCode;
	private Date scheduleDate;
	private String scheduleStartTime;
	private String scheduleEndTime;
	private int scheduleCost;
	private int scheduleStatus;
	public Schedule() {
		super();
	}
	public Schedule(int scheduleNo, int scheduleCCode, Date scheduleDate, String scheduleStartTime,
			String scheduleEndTime, int scheduleCost, int scheduleStatus) {
		super();
		this.scheduleNo = scheduleNo;
		this.scheduleCCode = scheduleCCode;
		this.scheduleDate = scheduleDate;
		this.scheduleStartTime = scheduleStartTime;
		this.scheduleEndTime = scheduleEndTime;
		this.scheduleCost = scheduleCost;
		this.scheduleStatus = scheduleStatus;
	}
	public int getScheduleNo() {
		return scheduleNo;
	}
	public void setScheduleNo(int scheduleNo) {
		this.scheduleNo = scheduleNo;
	}
	public int getScheduleCCode() {
		return scheduleCCode;
	}
	public void setScheduleCCode(int scheduleCCode) {
		this.scheduleCCode = scheduleCCode;
	}
	public Date getScheduleDate() {
		return scheduleDate;
	}
	public void setScheduleDate(Date scheduleDate) {
		this.scheduleDate = scheduleDate;
	}
	public String getScheduleStartTime() {
		return scheduleStartTime;
	}
	public void setScheduleStartTime(String scheduleStartTime) {
		this.scheduleStartTime = scheduleStartTime;
	}
	public String getScheduleEndTime() {
		return scheduleEndTime;
	}
	public void setScheduleEndTime(String scheduleEndTime) {
		this.scheduleEndTime = scheduleEndTime;
	}
	public int getScheduleCost() {
		return scheduleCost;
	}
	public void setScheduleCost(int scheduleCost) {
		this.scheduleCost = scheduleCost;
	}
	public int getScheduleStatus() {
		return scheduleStatus;
	}
	public void setScheduleStatus(int scheduleStatus) {
		this.scheduleStatus = scheduleStatus;
	}

}
