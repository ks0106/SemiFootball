package notice.model.dao;

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
import notice.model.vo.NoticeVo;

public class NoticeDao {
	private Properties prop = new Properties();
	public NoticeDao() {
		String fileName = NoticeDao.class.getResource("/sql/notice/noticeQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<NoticeVo> NoticeList(Connection conn, int start,int end){
		PreparedStatement pstmt = null;
		ArrayList<NoticeVo> list = null;
		ResultSet rset = null;
		String query = prop.getProperty("NoticeList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<NoticeVo>();
			while(rset.next()) {
				NoticeVo nv = new NoticeVo();
				nv.setSeqnoticeno(rset.getInt("seq_notice_no"));
				nv.setNoticetitle(rset.getString("notice_title"));
				nv.setNoticewriter(rset.getString("notice_writer"));
				nv.setNoticedate(rset.getDate("notice_date"));
				nv.setFilename(rset.getString("filename"));
				nv.setFilepath(rset.getString("filepath"));
				list.add(nv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
			JDBCTemplate.close(rset);
		}
		return list;
	}
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("totalCount");
		int result = 0;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
}
