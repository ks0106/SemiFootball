package reservation.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.vo.Branch;
import common.JDBCTemplate;
import court.model.vo.Court;
import goods.model.vo.Goods;
import reservation.model.dao.ReservationDao;
import schedule.model.vo.Schedule;

public class ReservationService {
	public ArrayList<Branch> reservationBranch() throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Branch> list = new ReservationDao().reservationBranch(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public Branch reservationBranch(int rCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		Branch b = new ReservationDao().reservationBranch(conn,rCode);
		JDBCTemplate.close(conn);
		return b;
	}
	public ArrayList<Court> reservationCourtList(String result, int bCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Court> list = new ReservationDao().reservationCourtList(conn, result, bCode);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Schedule> reservationCourtSelect(String result, int cCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Schedule> list = new ReservationDao().reservationCourtSelect(conn, result, cCode);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Goods> reservationGoodsList(String result, int bCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Goods> list = new ReservationDao().reservationGoodsList(conn, result, bCode);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Goods> reservationOptionList(String result, int bCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Goods> list = new ReservationDao().reservationOptionList(conn, result, bCode);
		JDBCTemplate.close(conn);
		return list;
	}
	public int reservationGoodsCount(String result, int goodsGId, int bCode) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int count = new ReservationDao().reservationGoodsCount(conn, result, goodsGId, bCode);
		JDBCTemplate.close(conn);
		return count;
	}
	public Goods reservationGoodsPrice(String goods, String option) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Goods g = new ReservationDao().reservationGoodsPrice(conn, goods, option);
		JDBCTemplate.close(conn);
		return g;
	}
}
