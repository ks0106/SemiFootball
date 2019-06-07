package reservation.model.vo;

import branch.model.vo.Branch;
import court.model.vo.Court;
import rental.model.vo.Rental;

public class ReservationViewPageData {
	private Reservation res;
	private Branch b;
	private Court c ;
	private Rental r;
	public ReservationViewPageData() {
		super();
	}
	public ReservationViewPageData(Reservation res, Branch b, Court c, Rental r) {
		super();
		this.res = res;
		this.b = b;
		this.c = c;
		this.r = r;
	}
	public Reservation getRes() {
		return res;
	}
	public void setRes(Reservation res) {
		this.res = res;
	}
	public Branch getB() {
		return b;
	}
	public void setB(Branch b) {
		this.b = b;
	}
	public Court getC() {
		return c;
	}
	public void setC(Court c) {
		this.c = c;
	}
	public Rental getR() {
		return r;
	}
	public void setR(Rental r) {
		this.r = r;
	}

}
