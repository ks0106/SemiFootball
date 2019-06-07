package league.model.vo;

public class AfterTeam {
	private String teamName;
	private String filepath;
	private int leagueNo;
	private int match1;
	private int match2;
	private int match3;
	public AfterTeam() {
		super();
		// TODO Auto-generated constructor stub
	}
	public AfterTeam(String teamName, String filepath, int leagueNo, int match1, int match2, int match3) {
		super();
		this.teamName = teamName;
		this.filepath = filepath;
		this.leagueNo = leagueNo;
		this.match1 = match1;
		this.match2 = match2;
		this.match3 = match3;
	}
	public String getTeamName() {
		return teamName;
	}
	public void setTeamName(String teamName) {
		this.teamName = teamName;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getleagueNo() {
		return leagueNo;
	}
	public void setleagueNo(int leagueNo) {
		this.leagueNo = leagueNo;
	}
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
	
}
