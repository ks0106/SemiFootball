package notice.model.vo;

import java.sql.Date;

public class NoticeVo {
	private int seqnoticeno;
	private String noticetitle;
	private String noticewriter;
	private Date noticedate;
	private String noticecontent;
	private String filename;
	private String filepath;
	private int rnum;
	public NoticeVo() {
		super();
		// TODO Auto-generated constructor stub
	}
	public NoticeVo(int seqnoticeno, String noticetitle, String noticewriter, Date noticedate, String noticecontent,
			String filename, String filepath, int rnum) {
		super();
		this.seqnoticeno = seqnoticeno;
		this.noticetitle = noticetitle;
		this.noticewriter = noticewriter;
		this.noticedate = noticedate;
		this.noticecontent = noticecontent;
		this.filename = filename;
		this.filepath = filepath;
		this.rnum = rnum;
	}
	public int getSeqnoticeno() {
		return seqnoticeno;
	}
	public void setSeqnoticeno(int seqnoticeno) {
		this.seqnoticeno = seqnoticeno;
	}
	public String getNoticetitle() {
		return noticetitle;
	}
	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}
	public String getNoticewriter() {
		return noticewriter;
	}
	public void setNoticewriter(String noticewriter) {
		this.noticewriter = noticewriter;
	}
	public Date getNoticedate() {
		return noticedate;
	}
	public void setNoticedate(Date noticedate) {
		this.noticedate = noticedate;
	}
	public String getNoticecontent() {
		return noticecontent;
	}
	public void setNoticecontent(String noticecontent) {
		this.noticecontent = noticecontent;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public int getRnum() {
		return rnum;
	}
	public void setRnum(int rnum) {
		this.rnum = rnum;
	}

}
