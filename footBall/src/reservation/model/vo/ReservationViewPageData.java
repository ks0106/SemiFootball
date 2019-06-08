package reservation.model.vo;

import java.util.ArrayList;

import branch.model.vo.Branch;
import court.model.vo.Court;
import goods.model.vo.Goods;
import rental.model.vo.Rental;

public class ReservationViewPageData {
	private Reservation res;
	private Branch b;
	private Court c;
	private ArrayList<Rental> rList;
	private ArrayList<Goods> gList;
	public ReservationViewPageData() {
		super();
	}
	public ReservationViewPageData(Reservation res, Branch b, Court c, ArrayList<Rental> rList,
			ArrayList<Goods> gList) {
		super();
		this.res = res;
		this.b = b;
		this.c = c;
		this.rList = rList;
		this.gList = gList;
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
	public ArrayList<Rental> getrList() {
		return rList;
	}
	public void setrList(ArrayList<Rental> rList) {
		this.rList = rList;
	}
	public ArrayList<Goods> getgList() {
		return gList;
	}
	public void setgList(ArrayList<Goods> gList) {
		this.gList = gList;
	}
}
