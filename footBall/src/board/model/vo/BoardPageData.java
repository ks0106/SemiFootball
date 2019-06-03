package board.model.vo;

import java.util.ArrayList;

public class BoardPageData {
	private ArrayList<BoardVo> blist;
	private String pageNavi;
	public BoardPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardPageData(ArrayList<BoardVo> blist, String pageNavi) {
		super();
		this.blist = blist;
		this.pageNavi = pageNavi;
	}
	public ArrayList<BoardVo> getBlist() {
		return blist;
	}
	public void setBlist(ArrayList<BoardVo> blist) {
		this.blist = blist;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
}
