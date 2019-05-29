package matching.model.vo;

import java.util.ArrayList;

public class RecPageData {
	private ArrayList<Recruit> list;
	private String pageNavi;
	
	public RecPageData() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RecPageData(ArrayList<Recruit> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}

	public ArrayList<Recruit> getList() {
		return list;
	}

	public void setList(ArrayList<Recruit> list) {
		this.list = list;
	}

	public String getPageNavi() {
		return pageNavi;
	}

	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
