package reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import branch.model.vo.Branch;
import common.JDBCTemplate;
import reservation.model.vo.Court;

public class ReservationDao {
	private Properties prop = new Properties();
	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservationQuery.properties").getPath();		//절대경로
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Branch> reservationBranch(Connection conn) throws SQLException{
		ArrayList<Branch> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationBranchList");
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		list = new ArrayList<Branch>();
		while(rset.next()) {
			Branch b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
			list.add(b);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	
	public ArrayList<Court> reservationCourt(Connection conn,int rCode) throws SQLException{
		ArrayList<Court> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourt");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, rCode);
		rset = pstmt.executeQuery();
		list = new ArrayList<Court>();
		while(rset.next()) {
			Court c = new Court();
			c.setCourtBCode(rset.getInt("court_b_code"));
			c.setCourtCCode(rset.getInt("court_c_code"));
			c.setCourtName(rset.getString("court_name"));
			c.setCourtStatus(rset.getInt("court_status"));
			list.add(c);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public Branch reservationBranch(Connection conn, int rCode) throws SQLException {
		Branch b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationBranch");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, rCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return b;
	}

}
