package FAQ.model.vo;

import java.util.ArrayList;

public class FAQPageData {
	private ArrayList<FAQVo> list;
	private String pageNavi;
	public FAQPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public FAQPageData(ArrayList<FAQVo> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<FAQVo> getList() {
		return list;
	}
	public void setList(ArrayList<FAQVo> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
