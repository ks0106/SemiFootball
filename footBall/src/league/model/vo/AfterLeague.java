package league.model.vo;

import java.sql.Date;

public class AfterLeague {

	private int leagueAfterNo;
	private String leagueAfterTitle;
	private String leagueAfterWriter;
	private Date leagueAfterEnrolldate;
	private int leagueNo;
	private String filepath;
	public AfterLeague() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	

	public AfterLeague(int leagueAfterNo, String leagueAfterTitle, String leagueAfterWriter, Date leagueAfterEnrolldate,
			int leagueNo, String filepath) {
		super();
		this.leagueAfterNo = leagueAfterNo;
		this.leagueAfterTitle = leagueAfterTitle;
		this.leagueAfterWriter = leagueAfterWriter;
		this.leagueAfterEnrolldate = leagueAfterEnrolldate;
		this.leagueNo = leagueNo;
		this.filepath = filepath;
	}



	public int getLeagueAfterNo() {
		return leagueAfterNo;
	}
	public void setLeagueAfterNo(int leagueAfterNo) {
		this.leagueAfterNo = leagueAfterNo;
	}
	public String getLeagueAfterTitle() {
		return leagueAfterTitle;
	}
	public void setLeagueAfterTitle(String leagueAfterTitle) {
		this.leagueAfterTitle = leagueAfterTitle;
	}
	public String getLeagueAfterWriter() {
		return leagueAfterWriter;
	}
	public void setLeagueAfterWriter(String leagueAfterWriter) {
		this.leagueAfterWriter = leagueAfterWriter;
	}
	public Date getLeagueAfterEnrolldate() {
		return leagueAfterEnrolldate;
	}
	public void setLeagueAfterEnrolldate(Date leagueAfterEnrolldate) {
		this.leagueAfterEnrolldate = leagueAfterEnrolldate;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}



	public int getLeagueNo() {
		return leagueNo;
	}



	public void setLeagueNo(int leagueNo) {
		this.leagueNo = leagueNo;
	}
	
}
