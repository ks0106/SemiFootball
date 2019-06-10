package matching.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class Recruit {
	private int seqRecNo;
	private String recName;
	private String recBName;
	private String recCName;
	private int recBCode;
	private int recCCode;
	private String recPhone;
	private int amount;
	private Date recDate;
	private String recTime;
	private String recLevel;
	private int recAble;
	private String recMemo;
	private Date recEnrollDate;
	private String date2;
	private String able2;
	private String amount2;
	
	public Recruit() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Recruit(int seqRecNo, String recName, int recBCode, int recCCode, String recPhone, int amount,
			Date recDate, String recTime, String recLevel, int recAble, String recMemo) {
		super();
		this.seqRecNo = seqRecNo;
		this.recName = recName;
		this.recBCode = recBCode;
		this.recCCode = recCCode;
		this.recPhone = recPhone;
		this.amount = amount;
		this.recDate = recDate;
		this.recTime = recTime;
		this.recLevel = recLevel;
		this.recAble = recAble;
		this.recMemo = recMemo;
	}

	public int getRecBCode() {
		return recBCode;
	}

	public void setRecBCode(int recBCode) {
		this.recBCode = recBCode;
	}

	public int getRecCCode() {
		return recCCode;
	}

	public void setRecCCode(int recCCode) {
		this.recCCode = recCCode;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public String getRecCName() {
		return recCName;
	}
	public void setRecCName(String recCName) {
		this.recCName = recCName;
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

	
	

	public String getAmount2() {
		return amount2;
	}

	public void setAmount2(int amount) {
		if(amount>0) {
			this.amount2 = amount+"명";
		}
	}

	public String getDate2() {
		return date2;
	}

	public void setDate2(Date recDate) {
		SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd");
		this.date2 = fo.format(recDate);
	}

	public String getAble2() {
		return able2;
	}

	public void setAble2(int recAble) {
		if(recAble==0) {
			this.able2="가능";
		}else {
			this.able2="마감";
		}
	}

	
}
