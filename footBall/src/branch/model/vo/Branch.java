package branch.model.vo;

public class Branch {
	private int branchCode;
	private String branchName;
	private String branchAddr;
	private String branchPhone;
	private String branchTel;
	
	public Branch() {
		super();
	}

	public Branch(int branchCode, String branchName, String branchAddr, String branchPhone, String branchTel) {
		super();
		this.branchCode = branchCode;
		this.branchName = branchName;
		this.branchAddr = branchAddr;
		this.branchPhone = branchPhone;
		this.branchTel = branchTel;
	}

	public int getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(int branchCode) {
		this.branchCode = branchCode;
	}

	public String getBranchName() {
		return branchName;
	}

	public void setBranchName(String branchName) {
		this.branchName = branchName;
	}

	public String getBranchAddr() {
		return branchAddr;
	}

	public void setBranchAddr(String branchAddr) {
		this.branchAddr = branchAddr;
	}

	public String getBranchPhone() {
		return branchPhone;
	}

	public void setBranchPhone(String branchPhone) {
		this.branchPhone = branchPhone;
	}

	public String getBranchTel() {
		return branchTel;
	}

	public void setBranchTel(String branchTel) {
		this.branchTel = branchTel;
	}
	
	
}
