package rental.model.vo;

public class Rental {
	private int rentalNo;
	private String rentalId;
	private int rentalResNo;
	private int rentalGNo;
	private int rentalGAmount;
	public Rental() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Rental(int rentalNo, String rentalId, int rentalResNo, int rentalGNo, int rentalGAmount) {
		super();
		this.rentalNo = rentalNo;
		this.rentalId = rentalId;
		this.rentalResNo = rentalResNo;
		this.rentalGNo = rentalGNo;
		this.rentalGAmount = rentalGAmount;
	}
	public int getRentalNo() {
		return rentalNo;
	}
	public void setRentalNo(int rentalNo) {
		this.rentalNo = rentalNo;
	}
	public String getRentalId() {
		return rentalId;
	}
	public void setRentalId(String rentalId) {
		this.rentalId = rentalId;
	}
	public int getRentalResNo() {
		return rentalResNo;
	}
	public void setRentalResNo(int rentalResNo) {
		this.rentalResNo = rentalResNo;
	}
	public int getRentalGNo() {
		return rentalGNo;
	}
	public void setRentalGNo(int rentalGNo) {
		this.rentalGNo = rentalGNo;
	}
	public int getRentalGAmount() {
		return rentalGAmount;
	}
	public void setRentalGAmount(int rentalGAmount) {
		this.rentalGAmount = rentalGAmount;
	}
	
}
