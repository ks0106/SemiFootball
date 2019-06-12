package matching.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.vo.Recruit;

public class RecDao {
	public int countList(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_recruit where rec_type=0";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return result;
	}
	public ArrayList<Recruit> selectList(Connection conn , int start , int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recruit> list = new ArrayList<Recruit>();
		String query = "select * from (select ROWNUM as rNum,rr.* from (select court_name as c_name,branch_name as b_name ,r.* from FB_RECRUIT r join fb_branch  on (branch_code = rec_B_code) join fb_court on(court_C_code=rec_c_code) where rec_type=0 order by rec_no desc) rr) where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,start);
		pstmt.setInt(2,end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Recruit r = new Recruit();
			r.setSeqRecNo(rset.getInt("REC_NO"));
			r.setRecName(rset.getString("rec_name"));
			r.setRecCName(rset.getString("C_NAME"));
			r.setRecBName(rset.getString("B_NAME"));
			r.setRecCCode(rset.getInt("rec_c_code"));
			r.setRecBCode(rset.getInt("rec_b_code"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setAmount(rset.getInt("rec_amount"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	public Recruit selectOne(Connection conn , int pageNum) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Recruit r = null;
		String query = "select court_name as c_name,branch_name as b_name ,r.* from FB_RECRUIT r join fb_branch  on (branch_code = rec_B_code) join fb_court on(court_C_code=rec_c_code) where rec_no=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, pageNum);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			r = new Recruit();
			r.setSeqRecNo(rset.getInt("REC_NO"));
			r.setRecName(rset.getString("rec_name"));
			r.setRecCName(rset.getString("C_NAME"));
			r.setRecBName(rset.getString("B_NAME"));
			r.setRecCCode(rset.getInt("rec_c_code"));
			r.setRecBCode(rset.getInt("rec_b_code"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setAmount(rset.getInt("rec_amount"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return r;
	}
	public int addMerRec(Connection conn, Recruit r) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String  query = "insert into fb_recruit values(seq_rec_no.nextval,?,?,?,?,?,?,?,?,?,?,0,sysdate)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, r.getRecName());
		pstmt.setInt(2, r.getRecBCode());
		pstmt.setInt(3, r.getRecCCode());
		pstmt.setString(4,r.getRecPhone());
		pstmt.setInt(5, r.getAmount());
		pstmt.setDate(6, r.getRecDate());
		pstmt.setString(7,r.getRecTime());
		pstmt.setString(8, r.getRecLevel());
		pstmt.setInt(9, r.getRecAble());
		pstmt.setString(10, r.getRecMemo());
		result = pstmt.executeUpdate();
		return result;
	}
	public int modiRecContent(Connection conn, Recruit r) throws SQLException {
		PreparedStatement pstmt = null;
		int result= 0;
		String query = "update fb_recruit set rec_level =? , rec_able=? , rec_amount =? , rec_memo=? where rec_no =? ";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1,r.getRecLevel());
		pstmt.setInt(2,r.getRecAble());
		pstmt.setInt(3,r.getAmount());
		pstmt.setString(4, r.getRecMemo());
		pstmt.setInt(5, r.getSeqRecNo());
		result = pstmt.executeUpdate();
		return result;
	}
	public int searchCount(Connection conn, int branch, String keyword) throws SQLException {
		PreparedStatement pstmt =null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_recruit where rec_b_code=? and rec_name=? and rec_type=0";
		pstmt = conn.prepareStatement(query);
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
	public int searchCount2(Connection conn, int branch, String keyword) throws SQLException {
		PreparedStatement pstmt =null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_recruit where rec_b_code=? and rec_name=? and rec_type=1";
		pstmt = conn.prepareStatement(query);
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
	public ArrayList<Recruit> searchList(Connection conn, int start, int end, int branch, String keyword) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recruit> list = new ArrayList<Recruit>();
		String query = "select * from (select rownum as rnum , r.* from(select court_name as c_name,branch_name as b_name ,r.* from FB_RECRUIT r join fb_branch  on (branch_code = rec_B_code) join fb_court on(court_C_code=rec_c_code) where rec_b_code=? and rec_name like (?) and rec_type=0) r) where rnum between ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, branch);
		pstmt.setString(2, "%"+keyword+"%");
		pstmt.setInt(3, start);
		pstmt.setInt(4, end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Recruit r = new Recruit();
			r.setSeqRecNo(rset.getInt("REC_NO"));
			r.setRecName(rset.getString("rec_name"));
			r.setRecCName(rset.getString("C_NAME"));
			r.setRecBName(rset.getString("B_NAME"));
			r.setRecCCode(rset.getInt("rec_c_code"));
			r.setRecBCode(rset.getInt("rec_b_code"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setAmount(rset.getInt("rec_amount"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
			list.add(r);
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rset);
		return list;
		
	}
	public ArrayList<Recruit> searchList2(Connection conn, int start, int end, int branch, String keyword) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recruit> list = new ArrayList<Recruit>();
		String query = "select * from (select rownum as rnum , r.* from(select court_name as c_name,branch_name as b_name ,r.* from FB_RECRUIT r join fb_branch  on (branch_code = rec_B_code) join fb_court on(court_C_code=rec_c_code) where rec_b_code=? and rec_name like (?) and rec_type=1) r) where rnum between ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, branch);
		pstmt.setString(2, "%"+keyword+"%");
		pstmt.setInt(3, start);
		pstmt.setInt(4, end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Recruit r = new Recruit();
			r.setSeqRecNo(rset.getInt("REC_NO"));
			r.setRecName(rset.getString("rec_name"));
			r.setRecCName(rset.getString("C_NAME"));
			r.setRecBName(rset.getString("B_NAME"));
			r.setRecCCode(rset.getInt("rec_c_code"));
			r.setRecBCode(rset.getInt("rec_b_code"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setAmount(rset.getInt("rec_amount"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
			list.add(r);
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rset);
		return list;
		
	}
	public int countList2(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_recruit where rec_type=1";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return result;
	}
	
	public ArrayList<Recruit> selectList2(Connection conn, int start, int end) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<Recruit> list = new ArrayList<Recruit>();
		String query = "select * from (select ROWNUM as rNum,rr.* from (select court_name as c_name,branch_name as b_name ,r.* from FB_RECRUIT r join fb_branch  on (branch_code = rec_B_code) join fb_court on(court_C_code=rec_c_code) where rec_type=1 order by rec_no desc) rr)where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,start);
		pstmt.setInt(2,end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Recruit r = new Recruit();
			r.setSeqRecNo(rset.getInt("REC_NO"));
			r.setRecName(rset.getString("rec_name"));
			r.setRecCName(rset.getString("C_NAME"));
			r.setRecBName(rset.getString("B_NAME"));
			r.setRecCCode(rset.getInt("rec_c_code"));
			r.setRecBCode(rset.getInt("rec_b_code"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setAmount(rset.getInt("rec_amount"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	public int deleteContent(Connection conn, int num) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from fb_recruit rec_no=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, num);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
}
