package gallery.model.service;

import java.sql.Connection;
import java.sql.SQLException;

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

}
