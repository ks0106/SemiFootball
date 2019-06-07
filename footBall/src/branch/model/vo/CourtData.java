package branch.model.vo;

public class CourtData {
	private int branchCode;
	private String c1;
	private String c2;
	private String c3;
	public CourtData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CourtData(int branchCode, String c1, String c2, String c3) {
		super();
		this.branchCode = branchCode;
		this.c1 = c1;
		this.c2 = c2;
		this.c3 = c3;
	}
	
	public int getBranchCode() {
		return branchCode;
	}
	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}
	public String getC1() {
		return c1;
	}
	public void setC1(String c1) {
		this.c1 = c1;
	}
	public String getC2() {
		return c2;
	}
	public void setC2(String c2) {
		this.c2 = c2;
	}
	public String getC3() {
		return c3;
	}
	public void setC3(String c3) {
		this.c3 = c3;
	}
	
	
}
