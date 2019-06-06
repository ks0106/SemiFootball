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
	
	public int reservationGoodsCount(Connection conn, String result, String option, int bCode) throws SQLException {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsCount");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setString(2, option);
		pstmt.setInt(3, bCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			count = rset.getInt("goods_count");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return count;
	}
	
	public Goods reservationGoodsPrice(Connection conn, String result, String option) throws SQLException {
		Goods g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsPrice");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setString(2, option);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			g = new Goods();
			g.setGoodsBCode(rset.getInt("goods_b_code"));
			g.setGoodsGId(rset.getInt("goods_g_id"));
			g.setGoodsCategory(rset.getString("goods_category"));
			g.setGoodsName(rset.getString("goods_name"));
			g.setGoodsSize(rset.getString("goods_size"));
			g.setGoodsPrice(rset.getInt("goods_price"));
			g.setGoodsCount(rset.getInt("goods_count"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return g;
	}
	
	public int reservationOrderSheet(Connection conn,String memberId,String memberPhone,int bCode,int cCode,String resDate,String[] resStartTime,String[] resEndTime,int allCost) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationOrderSheet");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setInt(2, cCode);
		pstmt.setString(3, memberId);
		pstmt.setString(4, memberPhone);
		pstmt.setString(5, resDate);
		String time = "";
		for(int i=0;i<resStartTime.length;i++) {
			time += resStartTime[i]+"~"+resEndTime[i];
			if(i < resStartTime.length - 1) {
				time += ",";
			}
		}
		pstmt.setString(6, time);
		pstmt.setInt(7, allCost);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationOrderNo(Connection conn,String memberId,int bCode,int cCode,String resDate,String[] resStartTime,String[] resEndTime,int allCost) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationOrderNo");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setInt(2, cCode);
		pstmt.setString(3, memberId);
		pstmt.setString(4, resDate);
		String time = "";
		for(int i=0;i<resStartTime.length;i++) {
			time += resStartTime[i]+"~"+resEndTime[i];
			if(i < resStartTime.length - 1) {
				time += ",";
			}
		}
		pstmt.setString(5, time);
		pstmt.setInt(6, allCost);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("res_no");
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rset);
		return result;
	}
	
	public int reservationGoodsNo(Connection conn,int bCode,String resGoodsName,String resGoodsOption) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsNo");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setString(2, resGoodsName);
		pstmt.setString(3, resGoodsOption);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("goods_g_id");
		}
		JDBCTemplate.close(pstmt);
		JDBCTemplate.close(rset);
		return result;
	}
	
	public int reservationRentalAddNextval(Connection conn,String memberId,int resNo,int goodsNo,int resGoodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationRentalAddNextval");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, resNo);
		pstmt.setInt(3, goodsNo);
		pstmt.setInt(4, resGoodsAmount);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationRentalAddCurrval(Connection conn,String memberId,int resNo,int goodsNo,int resGoodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationRentalAddCurrval");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, resNo);
		pstmt.setInt(3, goodsNo);
		pstmt.setInt(4, resGoodsAmount);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}	
	
	public int reservationRentalNo(Connection conn,String memberId,int resNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationRentalNo");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		pstmt.setInt(2, resNo);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("rental_no");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationOrderSheetUpdate(Connection conn,String memberId,int bCode,int cCode,String resDate,String[] resStartTime,String[] resEndTime,int allCost,int rentalNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationOrderSheetUpdate");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, rentalNo);
		pstmt.setInt(2, bCode);
		pstmt.setInt(3, cCode);
		pstmt.setString(4, memberId);
		pstmt.setString(5, resDate);
		String time = "";
		for(int i=0;i<resStartTime.length;i++) {
			time += resStartTime[i]+"~"+resEndTime[i];
			if(i < resStartTime.length - 1) {
				time += ",";
			}
		}
		pstmt.setString(6, time);
		System.out.println(rentalNo+","+bCode+","+cCode+","+memberId+","+resDate+","+time);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;		
	}
}
 