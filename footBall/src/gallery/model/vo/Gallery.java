package gallery.model.vo;

import java.sql.Date;

public class Gallery {
    private int photoNo;
    private String photoWriter;
	private String filename;
	private Date photoDate;
	
	public Gallery() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Gallery(int photoNo, String photoWriter, String filename, Date photoDate) {
		super();
		this.photoNo = photoNo;
		this.photoWriter = photoWriter;
		this.filename = filename;
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
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public Date getPhotoDate() {
		return photoDate;
	}
	public void setPhotoDate(Date photoDate) {
		this.photoDate = photoDate;
	}
}
