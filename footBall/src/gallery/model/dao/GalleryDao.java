package gallery.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
		pstmt.setString(2, g.getFilename());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public ArrayList<Gallery> morePhoto(Connection conn, int start, int end) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("morePhoto");
		ArrayList<Gallery> list = null;
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rset = pstmt.executeQuery();
		list = new ArrayList<Gallery>();
		while(rset.next()) {
			Gallery g = new Gallery();
			g.setPhotoNo(rset.getInt("seq_photo_no"));
			g.setPhotoWriter(rset.getString("photo_writer"));
			g.setFilename(rset.getString("filename"));
			g.setPhotoDate(rset.getDate("photo_date"));
			list.add(g);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public ArrayList<Gallery> photoList(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("photoList");
		ArrayList<Gallery> list = null;
		stmt = conn.createStatement();
		rset=stmt.executeQuery(query);
		list = new ArrayList<Gallery>();
		while(rset.next()) {
			Gallery g = new Gallery();
			g.setPhotoNo(rset.getInt("seq_photo_no"));
			g.setFilename(rset.getString("filename"));
			list.add(g);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	public int deletePhoto(Connection conn, Gallery g) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("deletePhoto");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, g.getPhotoNo());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
}
