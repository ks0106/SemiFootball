package board.model.vo;

import java.util.ArrayList;

public class BoardViewData {
	private ArrayList<BoardComment> list;
	private BoardVo bv;
	public BoardViewData() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardViewData(ArrayList<BoardComment> list, BoardVo bv) {
		super();
		this.list = list;
		this.bv = bv;
	}
	public ArrayList<BoardComment> getList() {
		return list;
	}
	public void setList(ArrayList<BoardComment> list) {
		this.list = list;
	}
	public BoardVo getBv() {
		return bv;
	}
	public void setBv(BoardVo bv) {
		this.bv = bv;
	}
	
}
