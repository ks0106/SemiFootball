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
import rental.model.vo.Rental;
import reservation.model.vo.Reservation;
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
	
	public ArrayList<Court> reservationCourtListAll(Connection conn, int bCode) throws SQLException{
		ArrayList<Court> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourtListAll");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		rset = pstmt.executeQuery();
		list = new ArrayList<Court>();
		while(rset.next()) {
			Court c = new Court();
			c.setCourtBCode(rset.getInt("court_b_code"));
			c.setCourtCCode(rset.getInt("court_c_code"));
			c.setCourtName(rset.getString("court_name"));
			c.setCourtType(rset.getString("court_type"));
			c.setCourtIndoor(rset.getString("court_indoor"));
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
	
	public ArrayList<Goods> reservationGoodsNameList(Connection conn, int bCode) throws SQLException{
		ArrayList<Goods> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsNameList");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		rset = pstmt.executeQuery();
		list = new ArrayList<Goods>();
		while(rset.next()) {
			Goods g = new Goods();
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
		System.out.println("DAO검증 : "+result+" "+option+" "+bCode+" "+count);
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return count;
	}
	
	public Goods reservationGoodsPrice(Connection conn, int bCode, String result, String option) throws SQLException {
		Goods g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsPrice");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, result);
		pstmt.setString(2, option);
		pstmt.setInt(3, bCode);
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
	
	public int reservationGoodsAmountUpdate(Connection conn,int goodsNo,int resGoodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationGoodsAmountUpdate");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resGoodsAmount);
		pstmt.setInt(2, goodsNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationGoodsAmountSet(Connection conn,int goodsNo,int resGoodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationGoodsAmountSet");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resGoodsAmount);
		pstmt.setInt(2, goodsNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;		
	}
	
	public int reservationCheckCourt(Connection conn,String resDate,int cCode,String startTime,String endTime) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCheckCourt");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, cCode);
		pstmt.setString(2, resDate);
		pstmt.setString(3, startTime);
		pstmt.setString(4, endTime);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			result = rset.getInt("schedule_status");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationScheduleStatus(Connection conn, int resNo, String resDate, int cCode, String startTime, String endTime) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationScheduleStatus");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		pstmt.setInt(2, cCode);
		pstmt.setString(3, resDate);
		pstmt.setString(4, startTime);
		pstmt.setString(5, endTime);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationScheduleStatusSet(Connection conn, int resNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationScheduleStatusSet");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;		
	}
	
	public int reservationPaymentUpdate(Connection conn,String memberId,String paymentId,String paymentNum,String paymentDate,int resNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationPaymentUpdate");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, paymentId);
		pstmt.setString(2, paymentNum);
		pstmt.setString(3, paymentDate);
		pstmt.setInt(4, resNo);
		pstmt.setString(5, memberId);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationRentalDelete(Connection conn, int resNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationRentalDelete");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationPaymentDelete(Connection conn, int resNo) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationPaymentDelete");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Reservation> reservationViewList(Connection conn, String memberId) throws SQLException{
		ArrayList<Reservation> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationViewList");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, memberId);
		rset = pstmt.executeQuery();
		list = new ArrayList<Reservation>();
		while(rset.next()) {
			Reservation r = new Reservation();
			r.setResNo(rset.getInt("res_no"));
			r.setResBCode(rset.getInt("res_b_code"));
			r.setResCCode(rset.getInt("res_c_code"));
			r.setResMEmail(rset.getString("res_m_email"));
			r.setResMPhone(rset.getString("res_m_phone"));
			r.setResDate(rset.getDate("res_date"));
			r.setResTime(rset.getString("res_time"));
			r.setResRentalNo(rset.getInt("res_rental_no"));
			r.setResTotalCost(rset.getInt("res_total_cost"));
			r.setResOrderDate(rset.getDate("res_order_date"));
			r.setResPaymentId(rset.getString("res_payment_id"));
			r.setResPaymentNum(rset.getString("res_payment_num"));
			r.setResPaymentDate(rset.getString("res_payment_date"));
			r.setResPayment(rset.getInt("res_payment"));
			r.setResCancel(rset.getInt("res_cancel"));
			r.setResCancelApplyDate(rset.getString("res_cancel_apply_date"));
			r.setResCancelDate(rset.getString("res_cancel_date"));
			r.setResBName(rset.getString("B_Name"));
			r.setResCName(rset.getString("C_name"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	
	public Reservation reservationResView(Connection conn, int resNo) throws SQLException {
		Reservation res = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationResView");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			res = new Reservation();
			res.setResNo(rset.getInt("res_no"));
			res.setResBCode(rset.getInt("res_b_code"));
			res.setResCCode(rset.getInt("res_c_code"));
			res.setResMEmail(rset.getString("res_m_email"));
			res.setResMPhone(rset.getString("res_m_phone"));
			res.setResDate(rset.getDate("res_date"));
			res.setResTime(rset.getString("res_time"));
			res.setResRentalNo(rset.getInt("res_rental_no"));
			res.setResTotalCost(rset.getInt("res_total_cost"));
			res.setResOrderDate(rset.getDate("res_order_date"));
			res.setResPaymentId(rset.getString("res_payment_id"));
			res.setResPaymentNum(rset.getString("res_payment_num"));
			res.setResPaymentDate(rset.getString("res_payment_date"));
			res.setResPayment(rset.getInt("res_payment"));
			res.setResCancel(rset.getInt("res_cancel"));
			res.setResCancelApplyDate(rset.getString("res_cancel_apply_date"));
			res.setResCancelDate(rset.getString("res_cancel_date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return res;
	}
	
	public Court reservationCourtView(Connection conn, int cCode) throws SQLException {
		Court c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourtView");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, cCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			c = new Court();
			c.setCourtBCode(rset.getInt("court_b_code"));
			c.setCourtCCode(rset.getInt("court_c_code"));
			c.setCourtName(rset.getString("court_name"));
			c.setCourtType(rset.getString("court_type"));
			c.setCourtStatus(rset.getInt("court_status"));
			c.setCourtIndoor(rset.getString("court_indoor"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return c;
	}
	
	public ArrayList<Rental> reservationRentalView(Connection conn, int resNo) throws SQLException {
		ArrayList<Rental> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationRentalView");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		rset = pstmt.executeQuery();
		list = new ArrayList<Rental>();
		while(rset.next()) {
			Rental r = new Rental();
			r.setRentalNo(rset.getInt("rental_no"));
			r.setRentalId(rset.getString("rental_id"));
			r.setRentalResNo(rset.getInt("rental_res_no"));
			r.setRentalGNo(rset.getInt("rental_g_no"));
			r.setRentalGAmount(rset.getInt("rental_g_amount"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}

	public Goods reservationRentalGoods(Connection conn, int gNo) throws SQLException{
		Goods g = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationRentalGoods");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, gNo);
		rset = pstmt.executeQuery();
		while(rset.next()) {
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
	
	public int reservationCancelApply(Connection conn, int resNo, String cancelApplyDate) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationCancelApply");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, cancelApplyDate);
		pstmt.setInt(2, resNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationCancelApplyRollback(Connection conn, int resNo, String payDate) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationCancelApplyRollback");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, resNo);
		pstmt.setString(2, payDate);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;		
	}
	
	public ArrayList<Reservation> reservationManagerList(Connection conn) throws SQLException{
		ArrayList<Reservation> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationManagerList");
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		list = new ArrayList<Reservation>();
		while(rset.next()) {
			Reservation r = new Reservation();
			r.setResNo(rset.getInt("res_no"));
			r.setResBCode(rset.getInt("res_b_code"));
			r.setResCCode(rset.getInt("res_c_code"));
			r.setResMEmail(rset.getString("res_m_email"));
			r.setResMPhone(rset.getString("res_m_phone"));
			r.setResDate(rset.getDate("res_date"));
			r.setResTime(rset.getString("res_time"));
			r.setResRentalNo(rset.getInt("res_rental_no"));
			r.setResTotalCost(rset.getInt("res_total_cost"));
			r.setResOrderDate(rset.getDate("res_order_date"));
			r.setResPaymentId(rset.getString("res_payment_id"));
			r.setResPaymentNum(rset.getString("res_payment_num"));
			r.setResPaymentDate(rset.getString("res_payment_date"));
			r.setResPayment(rset.getInt("res_payment"));
			r.setResCancel(rset.getInt("res_cancel"));
			r.setResCancelApplyDate(rset.getString("res_cancel_apply_date"));
			r.setResCancelDate(rset.getString("res_cancel_date"));
			list.add(r);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	
	public int reservationPaymentCancelAllow(Connection conn, int resNo, String date) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationPaymentCancelAllow");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, date);
		pstmt.setInt(2, resNo);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationManagerGoodsAdd(Connection conn, int bCode, String goodsCategory, String goodsName, String goodsSize, int goodsPrice, int goodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationManagerGoodsAdd");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setString(2, goodsCategory);
		pstmt.setString(3, goodsName);
		pstmt.setString(4, goodsSize);
		pstmt.setInt(5, goodsPrice);
		pstmt.setInt(6, goodsAmount);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationManagerGoodsDelete(Connection conn, int bCode, String goodsName, String goodsSize) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationManagerGoodsDelete");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setString(2, goodsName);
		pstmt.setString(3, goodsSize);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;		
	}
	
	public int reservationGoodsRentalCount(Connection conn, int bCode, String goodsName, String goodsSize) throws SQLException {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationGoodsRentalCount");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, goodsName);
		pstmt.setString(2, goodsSize);
		pstmt.setInt(3, bCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			count = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return count;
	}
	
	public int reservationManagerGoodsAmountModify(Connection conn, int bCode, String goodsName, String goodsSize, int goodsAmount) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationManagerGoodsAmountModify");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, goodsAmount);
		pstmt.setString(2, goodsName);
		pstmt.setString(3, goodsSize);
		pstmt.setInt(4, bCode);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public int reservationManagerGoodsPriceModify(Connection conn, int bCode, String goodsName, String goodsSize, int goodsPrice) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationManagerGoodsPriceModify");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, goodsPrice);
		pstmt.setString(2, goodsName);
		pstmt.setString(3, goodsSize);
		pstmt.setInt(4, bCode);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	
	public Court reservationCourtType(Connection conn, int bCode, int cCode) throws SQLException {
		Court c = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationCourtType");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, bCode);
		pstmt.setInt(2, cCode);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			c = new Court();
			c.setCourtBCode(rset.getInt("court_b_code"));
			c.setCourtCCode(rset.getInt("court_c_code"));
			c.setCourtName(rset.getString("court_name"));
			c.setCourtType(rset.getString("court_type"));
			c.setCourtIndoor(rset.getString("court_indoor"));
			c.setCourtStatus(rset.getInt("court_status"));
		}
		return c;
	}
	
	public int reservationScheduleCheck(Connection conn, int cCode, String startTime, String scheduleDate) throws SQLException {
		int check = 0;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("reservationScheduleCheck");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, cCode);
		pstmt.setString(2, scheduleDate);
		pstmt.setString(3, startTime);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			check = rset.getInt("cnt");			
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return check;
	}
	
	public int reservationManagerScheduleAdd(Connection conn, int cCode, String startTime, String endTime, int resPrice, String scheduleDate) throws SQLException {
		int result = 0;
		PreparedStatement pstmt = null;
		String query = prop.getProperty("reservationManagerScheduleAdd");
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, cCode);
		pstmt.setString(2, scheduleDate);
		pstmt.setString(3, startTime);
		pstmt.setString(4, endTime);
		pstmt.setInt(5, resPrice);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
}

 