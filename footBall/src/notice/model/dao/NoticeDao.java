package notice.model.dao;

import java.sql.Statement;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
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
	
	//전체리스트보기
	public ArrayList<NoticeVo> NoticeList(Connection conn,int start,int end){
		ArrayList<NoticeVo> list = null;
		PreparedStatement pstmt = null;
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
				nv.setNoticeNo(rset.getInt("notice_no"));
				nv.setNoticeTitle(rset.getString("notice_title"));
				nv.setNoticeWriter(rset.getString("notice_writer"));
				nv.setNoticeDate(rset.getDate("notice_date"));
				nv.setNoticeContent(rset.getString("notice_content"));
				nv.setNoticeHit(rset.getInt("notice_hit"));
				nv.setRnum(rset.getInt("rnum"));
				list.add(nv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int totalCount(Connection conn) {
		int result = 0;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("totalCount");
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
	
	//게시물하나보기
	public NoticeVo listOne(Connection conn,int noticeNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		NoticeVo nv = null;
		String query = prop.getProperty("ListOne");
		try {
			pstmt= conn.prepareStatement(query);
			pstmt.setInt(1, noticeNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				nv = new NoticeVo();
				nv.setNoticeNo(rset.getInt("notice_no"));
				nv.setNoticeTitle(rset.getString("notice_title"));
				nv.setNoticeWriter(rset.getString("notice_writer"));
				nv.setNoticeContent(rset.getString("notice_content"));
				nv.setNoticeDate(rset.getDate("notice_date"));
				nv.setNoticeHit(rset.getInt("notice_hit"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return nv;
	}
	
	//게시물등록
	public int noticeInsert(Connection conn, NoticeVo nv) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("noticeinsert");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nv.getNoticeTitle());
			pstmt.setString(2, nv.getNoticeWriter());
			pstmt.setString(3, nv.getNoticeContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println(result);
		return result;
	}
	
	//게시물 수정
	public int noticeUpdate(Connection conn, NoticeVo nv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("noticeupdate");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, nv.getNoticeTitle());
			pstmt.setString(2, nv.getNoticeContent());
			pstmt.setInt(3, nv.getNoticeNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
