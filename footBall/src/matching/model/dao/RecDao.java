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
		String query ="select count(*) cnt from fb_recruit";
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
		String query = "select * from (select ROWNUM as rNum,r.* from (select * from fb_recruit order by 1 desc) r) where rnum BETWEEN ? and ?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,start);
		pstmt.setInt(2,end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			Recruit r = new Recruit();
			r.setSeqRecNo(rset.getInt("SEQ_REC_NO"));
			r.setRecName(rset.getString("REC_NAME"));
			r.setRecBName(rset.getString("REC_B_NAME"));
			r.setRecPhone(rset.getString("REC_PHONE"));
			r.setRecDate(rset.getDate("REC_DATE"));
			r.setRecTime(rset.getString("REC_TIME"));
			r.setRecLevel(rset.getString("REC_LEVEL"));
			r.setRecAble(rset.getInt("REC_ABLE"));
			r.setRecPw(rset.getString("REC_PW"));
			r.setRecMemo(rset.getString("REC_MEMO"));
			r.setRecEnrollDate(rset.getDate("REC_ENROLL_DATE"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
}
