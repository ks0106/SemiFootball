package matching.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.vo.MatchList;

public class MatchDao {
	public int countList(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_matching";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return result;
	}
	public ArrayList<MatchList> selectList(Connection conn , int start , int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MatchList> list = new ArrayList<MatchList>();
		String query = "select * from (select ROWNUM as rNum,m.* from (select * from fb_matching order by 1 desc) m) where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,start);
		pstmt.setInt(2,end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			MatchList m = new MatchList();
			m.setSeqMatchNo(rset.getInt("match_no"));
			m.setMatchType(rset.getString("match_type"));
			m.setMatchBCode(rset.getInt("match_b_code"));
			m.setMatchCCode(rset.getInt("match_c_code"));
			m.setMatchWriter(rset.getString("match_writer"));
			m.setMatchPhone(rset.getString("match_phone"));
			m.setMatchDate(rset.getDate("match_date"));
			m.setMatchTime(rset.getString("match_time"));
			m.setmatchAmount(rset.getInt("match_amount"));
			m.setMatchLevel(rset.getString("match_level"));
			m.setMatchAble(rset.getInt("match_able"));
			m.setMatchMemo(rset.getString("match_memo"));
			m.setMatchEnrollDate(rset.getDate("match_enroll_date"));
			list.add(m);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	public MatchList selectOne(Connection conn , int pageNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		MatchList m = null;
		String query = "select * from Fb_matching where MATCH_NO=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,pageNum);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			m = new MatchList();
			m.setSeqMatchNo(rset.getInt("match_no"));
			m.setMatchType(rset.getString("match_type"));
			m.setMatchBCode(rset.getInt("match_b_code"));
			m.setMatchCCode(rset.getInt("match_c_code"));
			m.setMatchWriter(rset.getString("match_writer"));
			m.setMatchPhone(rset.getString("match_phone"));
			m.setMatchDate(rset.getDate("match_date"));
			m.setMatchTime(rset.getString("match_time"));
			m.setmatchAmount(rset.getInt("match_amount"));
			m.setMatchLevel(rset.getString("match_level"));
			m.setMatchAble(rset.getInt("match_able"));
			m.setMatchMemo(rset.getString("match_memo"));
			m.setMatchEnrollDate(rset.getDate("match_enroll_date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return m;
	}
	public int searchCount(Connection conn , String branch,String keyword) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_matching where match_B_Name=? and match_writer=?";
		pstmt=conn.prepareStatement(query);
		pstmt.setString(1, branch);
		pstmt.setString(2, keyword);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return result;
	}
	public ArrayList<MatchList> searchList(Connection conn , int start , int end ,String branch,String keyword) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MatchList> list = new ArrayList<MatchList>();
		String query = "select * from (select ROWNUM as rNum,m.* from (select * from fb_matching where MATCH_WRITER=? and MATCH_B_NAME=?)m)  where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, keyword);
		System.out.println(keyword);
		pstmt.setString(2, branch);
		System.out.println(branch);
		pstmt.setInt(3,start);
		pstmt.setInt(4,end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			MatchList m = new MatchList();
			m.setSeqMatchNo(rset.getInt("match_no"));
			m.setMatchType(rset.getString("match_type"));
			m.setMatchBCode(rset.getInt("match_b_code"));
			m.setMatchCCode(rset.getInt("match_c_code"));
			m.setMatchWriter(rset.getString("match_writer"));
			m.setMatchPhone(rset.getString("match_phone"));
			m.setMatchDate(rset.getDate("match_date"));
			m.setMatchTime(rset.getString("match_time"));
			m.setmatchAmount(rset.getInt("match_amount"));
			m.setMatchLevel(rset.getString("match_level"));
			m.setMatchAble(rset.getInt("match_able"));
			m.setMatchMemo(rset.getString("match_memo"));
			m.setMatchEnrollDate(rset.getDate("match_enroll_date"));
			list.add(m);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public int addMatchList(Connection conn , MatchList m) {
		
	}
}

























