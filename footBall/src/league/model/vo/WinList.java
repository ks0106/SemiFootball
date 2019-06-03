package league.model.vo;

import java.util.ArrayList;

public class WinList {
	private ArrayList<League> win2List;
	private ArrayList<League> win4List;
	private ArrayList<League> AllList;
	public WinList() {
		super();
		// TODO Auto-generated constructor stub
	}
	public WinList(ArrayList<League> win2List, ArrayList<League> win4List, ArrayList<League> allList) {
		super();
		this.win2List = win2List;
		this.win4List = win4List;
		AllList = allList;
	}
	public ArrayList<League> getWin2List() {
		return win2List;
	}
	public void setWin2List(ArrayList<League> win2List) {
		this.win2List = win2List;
	}
	public ArrayList<League> getWin4List() {
		return win4List;
	}
	public void setWin4List(ArrayList<League> win4List) {
		this.win4List = win4List;
	}
	public ArrayList<League> getAllList() {
		return AllList;
	}
	public void setAllList(ArrayList<League> allList) {
		AllList = allList;
	}
	
}
