package matching.model.vo;

import java.sql.Date;
import java.text.SimpleDateFormat;

public class MatchList {
	private int seqMatchNo;
	private String matchType;
	private int matchBCode;
	private int matchCCode;
	private String matchWriter;
	private String matchPhone;
	private Date matchDate;
	private String matchTime;
	private int matchAmount;
	private String matchLevel;
	private int matchAble;
	private String matchMemo;
	private Date matchEnrollDate;
	private String date;
	private String teamCount;
	private String able;
	public MatchList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	


	public MatchList(int seqMatchNo, String matchType, int matchBCode, int matchCCode, String matchWriter,
			String matchPhone, Date matchDate, String matchTime, int matchAmount, String matchLevel, int matchAble,
			String matchMemo, Date matchEnrollDate, String date, String teamCount, String able) {
		super();
		this.seqMatchNo = seqMatchNo;
		this.matchType = matchType;
		this.matchBCode = matchBCode;
		this.matchCCode = matchCCode;
		this.matchWriter = matchWriter;
		this.matchPhone = matchPhone;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.matchAmount = matchAmount;
		this.matchLevel = matchLevel;
		this.matchAble = matchAble;
		this.matchMemo = matchMemo;
		this.matchEnrollDate = matchEnrollDate;
		this.date = date;
		this.teamCount = teamCount;
		this.able = able;
	}




	public int getSeqMatchNo() {
		return seqMatchNo;
	}


	public void setSeqMatchNo(int seqMatchNo) {
		this.seqMatchNo = seqMatchNo;
	}


	public String getMatchType() {
		return matchType;
	}


	public void setMatchType(String matchType) {
		this.matchType = matchType;
	}


	public int getMatchBCode() {
		return matchBCode;
	}


	public void setMatchBCode(int matchBCode) {
		this.matchBCode = matchBCode;
	}


	public int getmatchCCode() {
		return matchCCode;
	}


	public void setMatchCCode(int matchCCode) {
		this.matchCCode = matchCCode;
	}


	public String getMatchWriter() {
		return matchWriter;
	}


	public void setMatchWriter(String matchWriter) {
		this.matchWriter = matchWriter;
	}


	public String getMatchPhone() {
		return matchPhone;
	}


	public void setMatchPhone(String matchPhone) {
		this.matchPhone = matchPhone;
	}


	public Date getMatchDate() {
		return matchDate;
	}


	public void setMatchDate(Date matchDate) {
		this.matchDate = matchDate;
	}


	public String getMatchTime() {
		return matchTime;
	}


	public void setMatchTime(String matchTime) {
		this.matchTime = matchTime;
	}


	public int getmatchAmount() {
		return matchAmount;
	}


	public void setmatchAmount(int matchAmount) {
		this.matchAmount = matchAmount;
	}



	public String getMatchLevel() {
		return matchLevel;
	}


	public void setMatchLevel(String matchLevel) {
		this.matchLevel = matchLevel;
	}


	public int getMatchAble() {
		return matchAble;
	}


	public void setMatchAble(int matchAble) {
		this.matchAble = matchAble;
	}



	public String getMatchMemo() {
		return matchMemo;
	}


	public void setMatchMemo(String matchMemo) {
		this.matchMemo = matchMemo;
	}


	public Date getMatchEnrollDate() {
		return matchEnrollDate;
	}


	public void setMatchEnrollDate(Date matchEnrollDate) {
		this.matchEnrollDate = matchEnrollDate;
	}
	public void setDate(Date matchDate) {
		SimpleDateFormat fo = new SimpleDateFormat("yyyy-MM-dd");
		this.date = fo.format(matchDate);
	}
	public String getDate() {
		return date;
	}

	public void setAble(int matchAble) {
		if(matchAble==0) {
			this.able="가능";
		}else {
			this.able="마감";
		}
	}
	public String getAble() {
		return able;
	}
	public void setTeamCount(int matchAmount) {
		if(matchAmount==1) {
			this.teamCount = "1팀";
		}else if(matchAmount==2) {
			this.teamCount="2팀";
		}
	}
	public String getTeamCount() {
		return teamCount;
	}
	public String getTeamCount1() {
		String teamCount = "";
		if(matchAmount==1) {
			teamCount = "1팀";
		}else if(matchAmount==2) {
			teamCount="2팀";
		}
		return teamCount; 
	}
	public String getAble1() {
		String able="";
		if(matchAble==0) {
			able="가능";
		}else {
			able="마감";
		}
		return able;
	}
}
