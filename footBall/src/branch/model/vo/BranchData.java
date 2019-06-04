package branch.model.vo;

import court.model.vo.Court;

public class BranchData {
	private Branch b;
	private BranchImgs bi;
	public BranchData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BranchData(Branch b, BranchImgs bi) {
		super();
		this.b = b;
		this.bi = bi;
	}
	
	public Branch getB() {
		return b;
	}
	public void setB(Branch b) {
		this.b = b;
	}
	public BranchImgs getBi() {
		return bi;
	}
	public void setBi(BranchImgs bi) {
		this.bi = bi;
	}
	
}
