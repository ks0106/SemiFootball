package branch.model.vo;

import court.model.vo.Court;

public class BranchData {
	private Branch b;
	private BranchImgs bi;
	private Court c;
	public BranchData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BranchData(Branch b, BranchImgs bi) {
		super();
		this.b = b;
		this.bi = bi;
	}
	public BranchData(Branch b, BranchImgs bi, Court c) {
		super();
		this.b = b;
		this.bi = bi;
		this.c = c;
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
	public Court getC() {
		return c;
	}
	public void setC(Court c) {
		this.c = c;
	}
	
	
}
