package league.model.vo;

import java.sql.Date;

public class LeagueList {
	private int leagueNo;
	private String leagueTitle;
	private String leagueWriter;
	private Date leagueEnrolldate;
	private String filepath;
	public LeagueList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LeagueList(int leagueNo, String leagueTitle, String leagueWriter, Date leagueEnrolldate, String filepath) {
		super();
		this.leagueNo = leagueNo;
		this.leagueTitle = leagueTitle;
		this.leagueWriter = leagueWriter;
		this.leagueEnrolldate = leagueEnrolldate;
		this.filepath = filepath;
	}
	public int getLeagueNo() {
		return leagueNo;
	}
	public void setLeagueNo(int leagueNo) {
		this.leagueNo = leagueNo;
	}
	public String getLeagueTitle() {
		return leagueTitle;
	}
	public void setLeagueTitle(String leagueTitle) {
		this.leagueTitle = leagueTitle;
	}
	public String getLeagueWriter() {
		return leagueWriter;
	}
	public void setLeagueWriter(String leagueWriter) {
		this.leagueWriter = leagueWriter;
	}
	public Date getLeagueEnrolldate() {
		return leagueEnrolldate;
	}
	public void setLeagueEnrolldate(Date leagueEnrolldate) {
		this.leagueEnrolldate = leagueEnrolldate;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	
}
