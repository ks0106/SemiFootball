package matching.model.vo;

import java.util.ArrayList;

public class MatchPageData {
	private String pageNavi;
	private ArrayList<MatchList> list;
	public MatchPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MatchPageData(String pageNavi, ArrayList<MatchList> list) {
		super();
		this.pageNavi = pageNavi;
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public ArrayList<MatchList> getList() {
		return list;
	}
	public void setList(ArrayList<MatchList> list) {
		this.list = list;
	}
}
