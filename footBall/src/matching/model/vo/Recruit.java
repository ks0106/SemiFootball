package matching.model.vo;

import java.sql.Date;

public class Recruit {
	private int seqRecNo;
	private String recName;
	private String recBName;
	private String recPhone;
	private Date recDate;
	private String recTime;
	private String recLevel;
	private int recAble;
	private String recPw;
	private String recMemo;
	private Date recEnrollDate;
	public Recruit() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Recruit(int seqRecNo, String recName, String recBName, String recPhone, Date recDate, String recTime,
			String recLevel, int recAble, String recPw, String recMemo, Date recEnrollDate) {
		super();
		this.seqRecNo = seqRecNo;
		this.recName = recName;
		this.recBName = recBName;
		this.recPhone = recPhone;
		this.recDate = recDate;
		this.recTime = recTime;
		this.recLevel = recLevel;
		this.recAble = recAble;
		this.recPw = recPw;
		this.recMemo = recMemo;
		this.recEnrollDate = recEnrollDate;
	}
	public int getSeqRecNo() {
		return seqRecNo;
	}
	public void setSeqRecNo(int seqRecNo) {
		this.seqRecNo = seqRecNo;
	}
	public String getRecName() {
		return recName;
	}
	public void setRecName(String recName) {
		this.recName = recName;
	}
	public String getRecBName() {
		return recBName;
	}
	public void setRecBName(String recBName) {
		this.recBName = recBName;
	}
	public String getRecPhone() {
		return recPhone;
	}
	public void setRecPhone(String recPhone) {
		this.recPhone = recPhone;
	}
	public Date getRecDate() {
		return recDate;
	}
	public void setRecDate(Date recDate) {
		this.recDate = recDate;
	}
	public String getRecTime() {
		return recTime;
	}
	public void setRecTime(String recTime) {
		this.recTime = recTime;
	}
	public String getRecLevel() {
		return recLevel;
	}
	public void setRecLevel(String recLevel) {
		this.recLevel = recLevel;
	}
	public int getRecAble() {
		return recAble;
	}
	public void setRecAble(int recAble) {
		this.recAble = recAble;
	}
	public String getRecPw() {
		return recPw;
	}
	public void setRecPw(String recPw) {
		this.recPw = recPw;
	}
	public String getRecMemo() {
		return recMemo;
	}
	public void setRecMemo(String recMemo) {
		this.recMemo = recMemo;
	}
	public Date getRecEnrollDate() {
		return recEnrollDate;
	}
	public void setRecEnrollDate(Date recEnrollDate) {
		this.recEnrollDate = recEnrollDate;
	}
	public String getAble1() {
		String able="";
		if(recAble==0) {
			able="가능";
		}else {
			able="마감";
		}
		return able;
	}
}
