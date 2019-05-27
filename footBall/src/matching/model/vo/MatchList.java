package matching.model.vo;

import java.sql.Date;

public class MatchList {
	private int seqMatchNo;
	private String matchType;
	private String matchBName;
	private String matchCName;
	private String matchWriter;
	private String matchPhone;
	private Date matchDate;
	private String matchTime;
	private int matchTeamCount;
	private String matchUColor;
	private String matchLevel;
	private int matchAble;
	private String matchPw;
	private String matchMemo;
	private Date matchEnrollDate;
	public MatchList() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	public MatchList(int seqMatchNo, String matchType, String matchBName, String matchCName, String matchWriter,
			String matchPhone, Date matchDate, String matchTime, int matchTeamCount, String matchUColor,
			String matchLevel, int matchAble, String matchPw, String matchMemo, Date matchEnrollDate) {
		super();
		this.seqMatchNo = seqMatchNo;
		this.matchType = matchType;
		this.matchBName = matchBName;
		this.matchCName = matchCName;
		this.matchWriter = matchWriter;
		this.matchPhone = matchPhone;
		this.matchDate = matchDate;
		this.matchTime = matchTime;
		this.matchTeamCount = matchTeamCount;
		this.matchUColor = matchUColor;
		this.matchLevel = matchLevel;
		this.matchAble = matchAble;
		this.matchPw = matchPw;
		this.matchMemo = matchMemo;
		this.matchEnrollDate = matchEnrollDate;
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


	public String getMatchBName() {
		return matchBName;
	}


	public void setMatchBName(String matchBName) {
		this.matchBName = matchBName;
	}


	public String getMatchCName() {
		return matchCName;
	}


	public void setMatchCName(String matchCName) {
		this.matchCName = matchCName;
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


	public int getMatchTeamCount() {
		return matchTeamCount;
	}


	public void setMatchTeamCount(int matchTeamCount) {
		this.matchTeamCount = matchTeamCount;
	}


	public String getMatchUColor() {
		return matchUColor;
	}


	public void setMatchUColor(String matchUColor) {
		this.matchUColor = matchUColor;
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


	public String getMatchPw() {
		return matchPw;
	}


	public void setMatchPw(String matchPw) {
		this.matchPw = matchPw;
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


	public String getAble() {
		String able = "";
		if(matchAble==0) {
			able="가능";
		}else {
			able="마감";
		}
		return able;
	}
	public String getTeamCount() {
		String teamCount="";
		if(matchTeamCount==1) {
			teamCount = "1팀";
		}else if(matchTeamCount==2) {
			teamCount="2팀";
		}
		return teamCount;
	}
	
}
