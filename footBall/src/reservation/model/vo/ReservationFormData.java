package reservation.model.vo;

import java.util.ArrayList;

import branch.model.vo.Branch;

public class ReservationFormData {
	private ArrayList<Court> cList;
	private ArrayList<Schedule> sList;
	public ReservationFormData() {
		super();
	}
	public ReservationFormData(ArrayList<Court> cList, ArrayList<Schedule> sList) {
		super();
		this.cList = cList;
		this.sList = sList;
	}
	public ArrayList<Court> getcList() {
		return cList;
	}
	public void setcList(ArrayList<Court> cList) {
		this.cList = cList;
	}
	public ArrayList<Schedule> getsList() {
		return sList;
	}
	public void setsList(ArrayList<Schedule> sList) {
		this.sList = sList;
	}
	
}
