package reservation.model.vo;

import java.util.ArrayList;

import branch.model.vo.Branch;

public class ReservationFormData {
	private ArrayList<Court> list;
	private Branch b;
	public ArrayList<Court> getList() {
		return list;
	}
	public void setList(ArrayList<Court> list) {
		this.list = list;
	}
	public Branch getB() {
		return b;
	}
	public void setB(Branch b) {
		this.b = b;
	}
	public ReservationFormData(ArrayList<Court> list, Branch b) {
		super();
		this.list = list;
		this.b = b;
	}
	public ReservationFormData() {
		super();
		// TODO Auto-generated constructor stub
	}

}
