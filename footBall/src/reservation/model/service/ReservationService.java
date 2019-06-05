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
	public int reservationGoodsCount(String result, String option, int bCode) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int count = new ReservationDao().reservationGoodsCount(conn, result, option, bCode);
		JDBCTemplate.close(conn);
		return count;
	}
	public Goods reservationGoodsPrice(String result, String option) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Goods g = new ReservationDao().reservationGoodsPrice(conn, result, option);
		JDBCTemplate.close(conn);
		return g;
	}
	public int reservationPayment(String memberId,String memberPhone,int bCode,String resDate,int cCode,String[] resGoodsName,String[] resGoodsOption,String[] resGoodsAmount,String[] resGoodsPrice,String[] resStartTime,String[] resEndTime,String[] resCost,int allCost) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int orderAdd = new ReservationDao().reservationOrderSheet(conn,memberId,memberPhone,bCode,cCode,resDate,resStartTime,resEndTime,allCost);
		if(orderAdd > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		if(resGoodsName != null) {
			int resNo = new ReservationDao().reservationOrderNo(conn,memberId,bCode,cCode,resDate,resStartTime,resEndTime,allCost);
			for(int i=0;i<resGoodsName.length;i++) {
				int goodsNo = new ReservationDao().reservationGoodsNo(conn,bCode,resGoodsName[i],resGoodsOption[i]);
				if(i == 0) {
					int rentalAdd = new ReservationDao().reservationRentalAddNextval(conn,memberId,resNo,goodsNo,Integer.parseInt(resGoodsAmount[i]));
					if(rentalAdd > 0) {
						JDBCTemplate.commit(conn);
					}else {
						JDBCTemplate.rollback(conn);
					}
				}else if(i > 0) {
					int rentalAdd = new ReservationDao().reservationRentalAddCurrval(conn,memberId,resNo,goodsNo,Integer.parseInt(resGoodsAmount[i]));
					if(rentalAdd > 0) {
						JDBCTemplate.commit(conn);
					}else {
						JDBCTemplate.rollback(conn);
					}
				}
			}
			int rentalNo = new ReservationDao().reservationRentalNo(conn,memberId,resNo);
			int result = new ReservationDao().reservationOrderSheetUpdate(conn,memberId,bCode,cCode,resDate,resStartTime,resEndTime,allCost,rentalNo);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result;
		}else {
			JDBCTemplate.close(conn);
			return orderAdd;
		}
	}
}
