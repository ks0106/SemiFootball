package court.model.vo;

public class Court {
	private int courtBCode;
	private int courtCCode;
	private String courtName;
	private String courtType;
	private String courtIndoor;
	private int courtStatus;
	public Court() {
		super();
	}
	public Court(int courtBCode, int courtCCode, String courtName, String courtType, String courtIndoor,
			int courtStatus) {
		super();
		this.courtBCode = courtBCode;
		this.courtCCode = courtCCode;
		this.courtName = courtName;
		this.courtType = courtType;
		this.courtIndoor = courtIndoor;
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
	public String getCourtType() {
		return courtType;
	}
	public void setCourtType(String courtType) {
		this.courtType = courtType;
	}
	public String getCourtIndoor() {
		return courtIndoor;
	}
	public void setCourtIndoor(String courtIndoor) {
		this.courtIndoor = courtIndoor;
	}
	public int getCourtStatus() {
		return courtStatus;
	}
	public void setCourtStatus(int courtStatus) {
		this.courtStatus = courtStatus;
	}
	
	
	

}
