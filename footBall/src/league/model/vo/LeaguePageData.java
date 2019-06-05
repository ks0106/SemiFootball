package league.model.vo;

import java.util.ArrayList;

public class LeaguePageData {
	private ArrayList<AfterLeague> list;
	private String pageNavi;
	public LeaguePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LeaguePageData(ArrayList<AfterLeague> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<AfterLeague> getList() {
		return list;
	}
	public void setList(ArrayList<AfterLeague> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
