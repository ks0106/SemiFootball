package gallery.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import common.JDBCTemplate;
import gallery.model.vo.Gallery;

public class GalleryDao {
	private Properties prop = new Properties();
	public GalleryDao(){
		String fileName = GalleryDao.class.getResource("/sql/gallery/galleryQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public int photoTotalCount(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("galleryTotalCount");
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return result;
	}
	public int insertGallery(Connection conn, Gallery g) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertGallery");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, g.getPhotoWriter());
		pstmt.setString(2, g.getPhotoContent());
		pstmt.setString(3, g.getFilepath());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}

}
