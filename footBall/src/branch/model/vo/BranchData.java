package branch.model.vo;


public class BranchData {
	private Branch b;
	private BranchImgs bi;
	private CourtData cd;
	public BranchData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BranchData(Branch b, BranchImgs bi) {
		super();
		this.b = b;
		this.bi = bi;
	}
	public BranchData(Branch b, BranchImgs bi, CourtData cd) {
		super();
		this.b = b;
		this.bi = bi;
		this.cd = cd;
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
	public CourtData getCd() {
		return cd;
	}
	public void setC(CourtData cd) {
		this.cd = cd;
	}
	
	
}
