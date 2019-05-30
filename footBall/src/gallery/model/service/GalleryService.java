package gallery.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import gallery.model.dao.GalleryDao;
import gallery.model.vo.Gallery;

public class GalleryService {

	public int photoTotalCount() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GalleryDao().photoTotalCount(conn);
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertPhoto(Gallery g) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GalleryDao().insertGallery(conn, g);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}

	public ArrayList<Gallery> morePhoto(int start) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int length = 5;
		ArrayList<Gallery> list = new GalleryDao().morePhoto(conn, start, start+length-1);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ArrayList<Gallery> photoList() throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Gallery> list = new GalleryDao().photoList(conn);
		return list;
	}

	public int GalleryDao(Gallery g) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GalleryDao().deletePhoto(conn, g);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
}
