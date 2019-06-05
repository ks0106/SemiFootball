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

import board.model.vo.BoardComment;
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
	//전체리스트
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
	//totalCount
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
	//하나의 게시물 보기
	public BoardVo listOne(Connection conn,int boardNo) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		BoardVo bv = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				bv=new BoardVo();
				bv.setBoardNo(rset.getInt("board_no"));
				bv.setBoardTitle(rset.getString("board_title"));
				bv.setBoardWriter(rset.getString("board_writer"));
				bv.setBoardContent(rset.getString("board_content"));
				bv.setBoardDate(rset.getDate("board_date"));
				bv.setBoardFilename(rset.getString("board_filename"));
				bv.setBoardFilepath(rset.getString("board_filepath"));
				bv.setBoardHit(rset.getInt("board_hit"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return bv;
	}
	
	//글작성
	public int boardInsert(Connection conn, BoardVo bv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("boardInsert");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bv.getBoardTitle());
			pstmt.setString(2, bv.getBoardWriter());
			pstmt.setString(3, bv.getBoardContent());
			pstmt.setString(4, bv.getBoardFilename());
			pstmt.setString(5, bv.getBoardFilepath());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//글수정
	public int boardUpdate(Connection conn, BoardVo bv) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("boardUpdate");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, bv.getBoardTitle());
			pstmt.setString(2, bv.getBoardContent());
			pstmt.setString(3, bv.getBoardFilename());
			pstmt.setString(4, bv.getBoardFilepath());
			pstmt.setInt(5, bv.getBoardNo());
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//글삭제
	public int boardDelete(Connection conn,int boardNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("boardDelete");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	//조회수증가
	public int boardHit(Connection conn, int boardNo) {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("boardhit");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//댓글리스트
	public ArrayList<BoardComment> selectCommentList(Connection conn,int boardNo){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardComment> list = null;
		String query = prop.getProperty("selectCommentList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardNo);
			rset = pstmt.executeQuery();
			list = new ArrayList<BoardComment>();
			while(rset.next()) {
				BoardComment bc = new BoardComment();
				bc.setBoardCommentNo(rset.getInt("board_comment_no"));
				bc.setBoardCommentLevel(rset.getInt("board_comment_level"));
				bc.setBoardCommentWriter(rset.getString("board_comment_writer"));
				bc.setBoardCommentContent(rset.getString("board_comment_content"));
				bc.setBoardRef(rset.getInt("board_ref"));
				bc.setBoardCommentRef(rset.getInt("board_comment_ref"));
				bc.setBoardCommentDate(rset.getDate("board_comment_date"));
				list.add(bc);
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
	
	//댓글작성
	public int insertBoardComment(Connection conn,BoardComment bc) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("insertBoardComment");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, bc.getBoardCommentLevel());
			pstmt.setString(2, bc.getBoardCommentWriter());
			pstmt.setString(3, bc.getBoardCommentContent());
			pstmt.setInt(4, bc.getBoardRef());
			pstmt.setString(5, bc.getBoardCommentRef()==0?null:String.valueOf(bc.getBoardCommentRef()));
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//댓글수정
	public int updateBoardComment(Connection conn,int boardCommentNo,String boardCommentContent) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateBoardComment");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, boardCommentContent);
			pstmt.setInt(2, boardCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	//댓글삭제
	public int boardCommentDelete(Connection conn,int boardCommentNo) {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("boardCommentDelete");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, boardCommentNo);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	
	//서치
	public int titleCount(Connection conn,String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("titleCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	
	public int writerCount(Connection conn,String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("writerCount");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<BoardVo> searchKeywordBoardTitle(Connection conn,int start,int end,String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardVo> list = null;
		String query = prop.getProperty("searchKeywordBoardTitle");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
	public ArrayList<BoardVo> searchKeywordBoardWriter(Connection conn,int start,int end,String keyword){
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<BoardVo> list = null;
		String query = prop.getProperty("searchKeywordBoardWriter");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
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
}
