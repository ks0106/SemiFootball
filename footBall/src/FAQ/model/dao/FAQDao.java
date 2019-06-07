package FAQ.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import FAQ.model.vo.FAQVo;
import common.JDBCTemplate;

public class FAQDao {
	private Properties prop = new Properties();
	public FAQDao() {
		String fileName = FAQDao.class.getResource("/sql/faq/faqQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	//FAQ작성
	public int insert(Connection conn, FAQVo fv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insert");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fv.getFaqTitle());
			pstmt.setString(2, fv.getFaqContent());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	//FAQ리스트보기
		public ArrayList<FAQVo> selectList(Connection conn,int start,int end){
			ArrayList<FAQVo> list = null;
			PreparedStatement pstmt = null;
			ResultSet rset = null;
			String query = prop.getProperty("selectList");
			try {
				pstmt = conn.prepareStatement(query);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
				rset = pstmt.executeQuery();
				list = new ArrayList<FAQVo>();
				while(rset.next()) {
					FAQVo fv = new FAQVo();
					fv.setFaqNo(rset.getInt("faq_no"));
					fv.setFaqTitle(rset.getString("faq_title"));
					fv.setFaqContent(rset.getString("faq_content"));
					list.add(fv);
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
	//FAQ수정
	public int faqUpdate(Connection conn, FAQVo fv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("faqupdate");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, fv.getFaqTitle());
			pstmt.setString(2, fv.getFaqContent());
			pstmt.setInt(3, fv.getFaqNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		System.out.println(result+"dao");
		return result;
	}
}
