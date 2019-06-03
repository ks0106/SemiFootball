package notice.model.vo;

import java.util.ArrayList;

public class NoticePageData {
	private ArrayList<NoticeVo> list;
	private String pageNavi;
	
	public NoticePageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticePageData(ArrayList<NoticeVo> list, String pageNavi) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
	}
	public ArrayList<NoticeVo> getList() {
		return list;
	}
	public void setList(ArrayList<NoticeVo> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	
}
