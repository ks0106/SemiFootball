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
import court.model.vo.Court;
import goods.model.vo.Goods;
import schedule.model.vo.Schedule;

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
	
	public ArrayList<Court> reservationCourtList(Connection conn, String result, int bCode) throws SQLException{
		ArrayList<Court> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourtList");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setString(2, result);
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
	
	public ArrayList<Schedule> reservationCourtSelect(Connection conn, String result, int cCode) throws SQLException{
		ArrayList<Schedule> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourtSelect");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setInt(2, cCode);
		rset = pstmt.executeQuery();
		list = new ArrayList<Schedule>();
		while(rset.next()) {
			Schedule s = new Schedule();
			s.setScheduleNo(rset.getInt("schedule_no"));
			s.setScheduleCCode(rset.getInt("schedule_c_code"));
			s.setScheduleDate(rset.getDate("schedule_date"));
			s.setScheduleStartTime(rset.getString("schedule_start_time"));
			s.setScheduleEndTime(rset.getString("schedule_end_time"));
			s.setScheduleCost(rset.getInt("schedule_cost"));
			s.setScheduleStatus(rset.getInt("schedule_status"));
			list.add(s);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public ArrayList<Goods> reservationGoodsList(Connection conn, String result, int bCode) throws SQLException{
		ArrayList<Goods> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsList");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setString(2, result);
		rset = pstmt.executeQuery();
		list = new ArrayList<Goods>();
		while(rset.next()) {
			Goods g = new Goods();
			g.setGoodsBCode(rset.getInt("goods_b_code"));
			g.setGoodsCategory(rset.getString("goods_category"));
			g.setGoodsName(rset.getString("goods_name"));
			list.add(g);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public ArrayList<Goods> reservationOptionList(Connection conn, String result, int bCode) throws SQLException{
		ArrayList<Goods> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationOptionList");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setInt(2, bCode);
		rset = pstmt.executeQuery();
		list = new ArrayList<Goods>();
		while(rset.next()) {
			Goods g = new Goods();
			g.setGoodsBCode(rset.getInt("goods_b_code"));
			g.setGoodsGId(rset.getInt("goods_g_id"));
			g.setGoodsCategory(rset.getString("goods_category"));
			g.setGoodsName(rset.getString("goods_name"));
			g.setGoodsSize(rset.getString("goods_size"));
			g.setGoodsPrice(rset.getInt("goods_price"));
			g.setGoodsCount(rset.getInt("goods_count"));
			list.add(g);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public int reservationGoodsCount(Connection conn, String result, int goodsGId, int bCode) throws SQLException {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsCount");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setInt(2, goodsGId);
		pstmt.setInt(3, bCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			count = rset.getInt("goods_count");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return count;
	}
}
 