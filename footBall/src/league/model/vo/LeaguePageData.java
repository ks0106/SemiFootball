package league.model.vo;

import java.util.ArrayList;

public class LeaguePageData {
	private ArrayList<AfterLeague> list;
	private LeagueList nowLeage;
	private String pageNavi;
	public LeaguePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LeaguePageData(ArrayList<AfterLeague> list, LeagueList nowLeage, String pageNavi) {
		super();
		this.list = list;
		this.nowLeage = nowLeage;
		this.pageNavi = pageNavi;
	}
	public ArrayList<AfterLeague> getList() {
		return list;
	}
	public void setList(ArrayList<AfterLeague> list) {
		this.list = list;
	}
	public LeagueList getNowLeage() {
		return nowLeage;
	}
	public void setNowLeage(LeagueList nowLeage) {
		this.nowLeage = nowLeage;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
	
}
