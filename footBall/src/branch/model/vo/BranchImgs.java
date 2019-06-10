package branch.model.vo;

public class BranchImgs {
	private int biBCode;
	private String bi1;
	private String bi2;
	private String bi3;
	private String bi4;
	public BranchImgs() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BranchImgs(int biBCode, String bi1, String bi2, String bi3, String bi4) {
		super();
		this.biBCode = biBCode;
		this.bi1 = bi1;
		this.bi2 = bi2;
		this.bi3 = bi3;
		this.bi4 = bi4;
	}
	public int getBiBCode() {
		return biBCode;
	}
	public void setBiBCode(int biBCode) {
		this.biBCode = biBCode;
	}
	public String getBi1() {
		return bi1;
	}
	public void setBi1(String bi1) {
		this.bi1 = bi1;
	}
	public String getBi2() {
		return bi2;
	}
	public void setBi2(String bi2) {
		this.bi2 = bi2;
	}
	public String getBi3() {
		return bi3;
	}
	public void setBi3(String bi3) {
		this.bi3 = bi3;
	}
	public String getBi4() {
		return bi4;
	}
	public void setBi4(String bi4) {
		this.bi4 = bi4;
	}
	@Override
	public String toString() {
		return biBCode + " / " + bi1 + " / " + bi2 + " / " + bi3 + " / " + bi4;
	}
	
	
}
