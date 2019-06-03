package court.model.vo;

public class Court {
	private int courtBCode;
	private int courtCCode;
	private String courtName;
	private int courtStatus;
	public Court() {
		super();
	}
	public Court(int courtBCode, int courtCCode, String courtName, int courtStatus) {
		super();
		this.courtBCode = courtBCode;
		this.courtCCode = courtCCode;
		this.courtName = courtName;
		this.courtStatus = courtStatus;
	}
	public int getCourtBCode() {
		return courtBCode;
	}
	public void setCourtBCode(int courtBCode) {
		this.courtBCode = courtBCode;
	}
	public int getCourtCCode() {
		return courtCCode;
	}
	public void setCourtCCode(int courtCCode) {
		this.courtCCode = courtCCode;
	}
	public String getCourtName() {
		return courtName;
	}
	public void setCourtName(String courtName) {
		this.courtName = courtName;
	}
	public int getCourtStatus() {
		return courtStatus;
	}
	public void setCourtStatus(int courtStatus) {
		this.courtStatus = courtStatus;
	}
	
	

}
