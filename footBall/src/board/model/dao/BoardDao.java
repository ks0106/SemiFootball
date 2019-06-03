package board.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import board.model.vo.BoardVo;
import common.JDBCTemplate;

public class BoardDao {
	private Properties prop = new Properties();
	public BoardDao() {
		String fileName = BoardDao.class.getResource("/sql/board/boardQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public ArrayList<BoardVo> boardList(Connection conn,int start,int end){
		ArrayList<BoardVo> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("boardList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<BoardVo>();
			while(rset.next()) {
				BoardVo bv = new BoardVo();
				bv.setBoardNo(rset.getInt("board_no"));
				bv.setBoardTitle(rset.getString("board_title"));
				bv.setBoardWriter(rset.getString("board_writer"));
				bv.setBoardContent(rset.getString("board_content"));
				bv.setBoardDate(rset.getDate("board_date"));
				bv.setBoardFilename(rset.getString("board_filename"));
				bv.setBoardFilepath(rset.getString("board_filepath"));
				bv.setBoardHit(rset.getInt("board_hit"));
				bv.setRnum(rset.getInt("rnum"));
				list.add(bv);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
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
}
