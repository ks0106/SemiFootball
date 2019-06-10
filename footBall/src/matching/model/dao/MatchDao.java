package matching.model.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.vo.MatchList;
import matching.model.vo.Recruit;

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
		String query = "select * from (select ROWNUM as rNum,m.* from (select court_name as c_name,branch_name as b_name ,m.* from FB_matching m join fb_branch  on (branch_code = match_B_code) join fb_court on(court_C_code=match_c_code) order by match_no desc) m) where rnum BETWEEN ? and ?";
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
			m.setMatchBName(rset.getString("b_name"));
			m.setMatchCName(rset.getString("c_name"));
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
		String query = "select court_name as c_name,branch_name as b_name ,m.* from FB_matching m join fb_branch  on (branch_code = match_B_code) join fb_court on(court_C_code=match_c_code) where match_no=?";
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
			m.setMatchCName(rset.getString("c_name"));
			m.setMatchBName(rset.getString("b_name"));
			
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return m;
	}
	public int searchCount(Connection conn , int branch,String keyword) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_matching where match_B_code=? and match_writer=?";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, branch);
		pstmt.setString(2, keyword);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return result;
	}
	public ArrayList<MatchList> searchList(Connection conn , int start , int end ,int branch,String keyword) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<MatchList> list = new ArrayList<MatchList>();
		String query = "select * from (select ROWNUM as rNum,m.* from (select court_name as c_name,branch_name as b_name ,m.* from FB_matching m join fb_branch  on (branch_code = match_B_code) join fb_court on(court_C_code=match_c_code) where match_B_code=? and match_writer like ? order by match_no desc) m) where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, branch);
		pstmt.setString(2, "%"+keyword+"%");
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
			m.setMatchCName(rset.getString("c_name"));
			m.setMatchBName(rset.getString("b_name"));
			list.add(m);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public int addMatchList(Connection conn , MatchList m) throws SQLException {
		PreparedStatement pstmt = null;
		int result =0;
		String query = "insert into fb_matching values(SEQ_MATCH_NO.NEXTVAL,?,?,?,?,?,?,?,?,?,?,?,sysdate) ";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, m.getMatchType());
		pstmt.setInt(2, m.getMatchBCode());
		pstmt.setInt(3, m.getmatchCCode());
		pstmt.setString(4,m.getMatchWriter());
		pstmt.setString(5, m.getMatchPhone());
		pstmt.setDate(6, m.getMatchDate());
		pstmt.setString(7, m.getMatchTime());
		pstmt.setString(8, m.getMatchLevel());
		pstmt.setInt(9, m.getMatchAble());
		pstmt.setInt(10, m.getmatchAmount());
		pstmt.setString(11, m.getMatchMemo());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int mercenaryAdd(Connection conn, Recruit r) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_recruit values(seq_rec_no.nextval,?,?,?,?,?,?,?,?,?,?,1,sysdate)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, r.getRecName());
		pstmt.setInt(2, r.getRecBCode());
		pstmt.setInt(3, r.getRecCCode());
		pstmt.setString(4, r.getRecPhone());
		pstmt.setInt(5,r.getAmount());
		pstmt.setDate(6, r.getRecDate());
		pstmt.setString(7,r.getRecTime());
		pstmt.setString(8, r.getRecLevel());
		pstmt.setInt(9, r.getRecAble());
		pstmt.setString(10, r.getRecMemo());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
}
