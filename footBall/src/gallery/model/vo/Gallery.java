package gallery.model.vo;

import java.sql.Date;

public class Gallery {
    private int photoNo;
    private String photoWriter;
	private String photoContent;
	private String filepath;
	private Date photoDate;
	
	public Gallery() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Gallery(int photoNo, String photoWriter, String photoContent, String filepath, Date photoDate) {
		super();
		this.photoNo = photoNo;
		this.photoWriter = photoWriter;
		this.photoContent = photoContent;
		this.filepath = filepath;
		this.photoDate = photoDate;
	}
	public String getPhotoWriter() {
		return photoWriter;
	}
	public void setPhotoWriter(String photoWriter) {
		this.photoWriter = photoWriter;
	}
	public int getPhotoNo() {
		return photoNo;
	}
	public void setPhotoNo(int photoNo) {
		this.photoNo = photoNo;
	}
	public String getPhotoContent() {
		return photoContent;
	}
	public void setPhotoContent(String photoContent) {
		this.photoContent = photoContent;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public Date getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}
}
