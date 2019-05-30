package league.model.vo;

public class League {
	private int teamNo;
	private String teamName;
	private String teamRep;
	private String teamPhone;
	private String teamEmail;
	private String teamColorHome;
	private String teamColorAway;
	private String filepath;
	public League() {
		super();
		// TODO Auto-generated constructor stub
	}
	public League(int teamNo, String teamName, String teamRep, String teamPhone, String teamEmail, String teamColorHome,
			String teamColorAway, String filepath) {
		super();
		this.teamNo = teamNo;
		this.teamName = teamName;
		this.teamRep = teamRep;
		this.teamPhone = teamPhone;
		this.teamEmail = teamEmail;
		this.teamColorHome = teamColorHome;
		this.teamColorAway = teamColorAway;
		this.filepath = filepath;
	}
	public int getTeamNo() {
		return teamNo;
	}
	public void setTeamNo(int teamNo) {
		this.teamNo = teamNo;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getTeamRep() {
		return teamRep;
	}
	public void setTeamRep(String teamRep) {
		this.teamRep = teamRep;
	}
	public String getTeamPhone() {
		return teamPhone;
	}
	public void setTeamPhone(String teamPhone) {
		this.teamPhone = teamPhone;
	}
	public String getTeamEmail() {
		return teamEmail;
	}
	public void setTeamEmail(String teamEmail) {
		this.teamEmail = teamEmail;
	}
	public String getTeamColorHome() {
		return teamColorHome;
	}
	public void setTeamColorHome(String teamColorHome) {
		this.teamColorHome = teamColorHome;
	}
	public String getTeamColorAway() {
		return teamColorAway;
	}
	public void setTeamColorAway(String teamColorAway) {
		this.teamColorAway = teamColorAway;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	  
}
