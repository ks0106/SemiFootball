package board.model.vo;

import java.sql.Date;

public class BoardVo {
	private int boardNo;
	private String boardTitle;
	private String boardWriter;
	private String boardContent;
	private Date boardDate;
	private String boardFilename;
	private String boardFilepath;
	private int boardHit;
	private int rnum;
	public BoardVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public BoardVo(int boardNo, String boardTitle, String boardWriter, String boardContent, Date boardDate,
			String boardFilename, String boardFilepath, int boardHit, int rnum) {
		super();
		this.boardNo = boardNo;
		this.boardTitle = boardTitle;
		this.boardWriter = boardWriter;
		this.boardContent = boardContent;
		this.boardDate = boardDate;
		this.boardFilename = boardFilename;
		this.boardFilepath = boardFilepath;
		this.boardHit = boardHit;
		this.rnum = rnum;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public String getBoardWriter() {
		return boardWriter;
	}
	public void setBoardWriter(String boardWriter) {
		this.boardWriter = boardWriter;
	}
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public String getBoardFilename() {
		return boardFilename;
	}
	public void setBoardFilename(String boardFilename) {
		this.boardFilename = boardFilename;
	}
	public String getBoardFilepath() {
		return boardFilepath;
	}
	public void setBoardFilepath(String boardFilepath) {
		this.boardFilepath = boardFilepath;
	}
	public int getBoardHit() {
		return boardHit;
	}
	public void setBoardHit(int boardHit) {
		this.boardHit = boardHit;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}
}
