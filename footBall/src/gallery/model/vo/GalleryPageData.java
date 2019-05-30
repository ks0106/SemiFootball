package gallery.model.vo;

import java.util.ArrayList;

import gallery.model.dao.GalleryDao;

public class GalleryPageData {
	private ArrayList<Gallery> list;
	private int reqPage;
	private String pageNavi;
	private int totalCount;
	private int totalPage;
	private int pageNaviSize;
	private int pageNo;
	
	public GalleryPageData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public GalleryPageData(ArrayList<Gallery> list, String pageNavi, int totalCount, int totalPage,int reqPage,int pageNaviSize,
			int pageNo) {
		super();
		this.list = list;
		this.pageNavi = pageNavi;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.pageNaviSize = pageNaviSize;
		this.pageNo = pageNo;
		this.reqPage = reqPage;
	}
	
	public int getReqPage() {
		return reqPage;
	}
	public void setReqPage(int reqPage) {
		this.reqPage = reqPage;
	}
	public ArrayList<Gallery> getList() {
		return list;
	}
	public void setList(ArrayList<Gallery> list) {
		this.list = list;
	}
	public String getPageNavi() {
		return pageNavi;
	}
	public void setPageNavi(String pageNavi) {
		this.pageNavi = pageNavi;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getPageNaviSize() {
		return pageNaviSize;
	}
	public void setPageNaviSize(int pageNaviSize) {
		this.pageNaviSize = pageNaviSize;
	}
	public int getPageNo() {
		return pageNo;
	}
	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
	
	
}
