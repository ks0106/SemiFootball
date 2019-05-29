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
			m.setSeqMatchNo(rset.getInt("seq_match_no"));
			m.setMatchType(rset.getString("match_type"));
			m.setMatchBName(rset.getString("match_b_name"));
			m.setMatchCName(rset.getString("match_c_name"));
			m.setMatchWriter(rset.getString("match_writer"));
			m.setMatchPhone(rset.getString("match_phone"));
			m.setMatchDate(rset.getDate("match_date"));
			m.setMatchTime(rset.getString("match_time"));
			m.setMatchTeamCount(rset.getInt("match_teamCount"));
			m.setMatchUColor(rset.getString("match_u_color"));
			m.setMatchLevel(rset.getString("match_level"));
			m.setMatchAble(rset.getInt("match_able"));
			m.setMatchPw(rset.getString("match_pw"));
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
		String query = "select * from Fb_matching where SEQ_MATCH_NO=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,pageNum);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			m = new MatchList();
			m.setSeqMatchNo(rset.getInt("seq_match_no"));
			m.setMatchType(rset.getString("match_type"));
			m.setMatchBName(rset.getString("match_b_name"));
			m.setMatchCName(rset.getString("match_c_name"));
			m.setMatchWriter(rset.getString("match_writer"));
			m.setMatchPhone(rset.getString("match_phone"));
			m.setMatchDate(rset.getDate("match_date"));
			m.setMatchTime(rset.getString("match_time"));
			m.setMatchTeamCount(rset.getInt("match_teamCount"));
			m.setMatchUColor(rset.getString("match_u_color"));
			m.setMatchLevel(rset.getString("match_level"));
			m.setMatchAble(rset.getInt("match_able"));
			m.setMatchPw(rset.getString("match_pw"));
			m.setMatchMemo(rset.getString("match_memo"));
			m.setMatchEnrollDate(rset.getDate("match_enroll_date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return m;
	}
}

























