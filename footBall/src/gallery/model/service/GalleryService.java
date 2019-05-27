package gallery.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import gallery.model.dao.GalleryDao;

public class GalleryService {

	public int photoTotalCount() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new GalleryDao().photoTotalCount(conn);
		JDBCTemplate.close(conn);
		return result;
	}

}