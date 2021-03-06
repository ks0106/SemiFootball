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
	private int teamTableLevel;
	private int match1;
	private int match2;
	private int match3;
	
	

	public int getMatch1() {
		return match1;
	}

	public void setMatch1(int match1) {
		this.match1 = match1;
	}

	public int getMatch2() {
		return match2;
	}

	public void setMatch2(int match2) {
		this.match2 = match2;
	}

	public int getMatch3() {
		return match3;
	}

	public void setMatch3(int match3) {
		this.match3 = match3;
	}

	public League(int teamNo, String teamName, String teamRep, String teamPhone, String teamEmail, String teamColorHome,
			String teamColorAway, String filepath, int teamTableLevel, int match1, int match2, int match3) {
		super();
		this.teamNo = teamNo;
		this.teamName = teamName;
		this.teamRep = teamRep;
		this.teamPhone = teamPhone;
		this.teamEmail = teamEmail;
		this.teamColorHome = teamColorHome;
		this.teamColorAway = teamColorAway;
		this.filepath = filepath;
		this.teamTableLevel = teamTableLevel;
		this.match1 = match1;
		this.match2 = match2;
		this.match3 = match3;
	}

	public League() {
		super();
		// TODO Auto-generated constructor stub
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
	public int getTeamTableLevel() {
		return teamTableLevel;
	}
	
	public void setTeamTableLevel(int teamTableLevel) {
		this.teamTableLevel = teamTableLevel;
	}
	  
}
