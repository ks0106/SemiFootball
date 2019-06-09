package reservation.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.vo.Branch;
import common.JDBCTemplate;
import court.model.vo.Court;
import goods.model.vo.Goods;
import rental.model.vo.Rental;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Reservation;
import reservation.model.vo.ReservationViewPageData;
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
	public Goods reservationGoodsPrice(int bCode, String result, String option) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Goods g = new ReservationDao().reservationGoodsPrice(conn, bCode, result, option);
		JDBCTemplate.close(conn);
		return g;
	}
	public int reservationPayment(String memberId,String memberPhone,int bCode,String resDate,int cCode,String[] resGoodsName,String[] resGoodsOption,String[] resGoodsAmount,String[] resGoodsPrice,String[] resStartTime,String[] resEndTime,String[] resCost,int allCost) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		//결제버튼 눌렀을 때 주문장 생성 -> 결제여부 : 0(결제안함)
		int orderAdd = new ReservationDao().reservationOrderSheet(conn,memberId,memberPhone,bCode,cCode,resDate,resStartTime,resEndTime,allCost);
		if(orderAdd > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		//주문한 물품이 있을 때 동작하는 구문
		if(resGoodsName != null) {
			//주문장에서 대관번호를 얻어옴
			int resNo = new ReservationDao().reservationOrderNo(conn,memberId,bCode,cCode,resDate,resStartTime,resEndTime,allCost);
			//주문한 물품의 종류만큼 반복 동작하는 구문
			for(int i=0;i<resGoodsName.length;i++) {
				//주문한 물품의 고유번호를 얻어옴
				int goodsNo = new ReservationDao().reservationGoodsNo(conn,bCode,resGoodsName[i],resGoodsOption[i]);
				//첫 번째 반복일 때 물품 대여 번호를 nextval로 동작하여 주문한 물품번호를 저장함
				if(i == 0) {
					int rentalAdd = new ReservationDao().reservationRentalAddNextval(conn,memberId,resNo,goodsNo,Integer.parseInt(resGoodsAmount[i]));
					if(rentalAdd > 0) {
						JDBCTemplate.commit(conn);
					}else {
						JDBCTemplate.rollback(conn);
					}
				//두 번째 반복부터 물품 대여 번호를 currval로 동작하여 주문한 물품번호를 저장함 (하나의 주문번호에 주문한 물품을 모두 저장하기 위함)
				}else if(i > 0) {
					int rentalAdd = new ReservationDao().reservationRentalAddCurrval(conn,memberId,resNo,goodsNo,Integer.parseInt(resGoodsAmount[i]));
					if(rentalAdd > 0) {
						JDBCTemplate.commit(conn);
					}else {
						JDBCTemplate.rollback(conn);
					}
				}
			}
			//물품 대여 번호를 얻어옴
			int rentalNo = new ReservationDao().reservationRentalNo(conn,memberId,resNo);
			//기존에 생성한 주문장에 물품 대여 번호를 입력
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
	
	public int reservationCheckCourt(String resDate, int cCode, String startTime, String endTime) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().reservationCheckCourt(conn,resDate,cCode,startTime,endTime);
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int reservationOrderNo(String memberId,int bCode,String resDate,int cCode,String[] resStartTime,String[] resEndTime,int allCost) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int resNo = new ReservationDao().reservationOrderNo(conn,memberId,bCode,cCode,resDate,resStartTime,resEndTime,allCost);
		JDBCTemplate.close(conn);
		return resNo;
	}
	
	public int reservationPaymentUpdate(String memberId,String paymentId,String paymentNum,String paymentDate,int resNo,String resDate,int cCode,String[] startTime,String[] endTime) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		//스케쥴 예약불가 전환
		int schedule = 0;
		for(int i=0;i<startTime.length;i++) {
			schedule = new ReservationDao().reservationScheduleStatus(conn, resNo, resDate, cCode, startTime[i], endTime[i]);
			if(schedule > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}
		//물품 카운트 줄임
		int goodsUpdate = 0;
		ArrayList<Rental> rList = new ReservationDao().reservationRentalView(conn, resNo);
		for(int i=0;i<rList.size();i++) {
			//렌탈 테이블에 물품 저장을 완료하면 주문한 물품의 고유번호를 이용하여 해당 물품의 재고를 나간 만큼 줄임(물품번호,주문 수량 필요)
			goodsUpdate = new ReservationDao().reservationGoodsAmountUpdate(conn,rList.get(i).getRentalGNo(),rList.get(i).getRentalGAmount());
			if(goodsUpdate > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}
		//대관테이블에 결제정보 추가
		int result = new ReservationDao().reservationPaymentUpdate(conn,memberId,paymentId,paymentNum,paymentDate,resNo);
		if(result > 0) {
			conn.commit();
		}else {
			conn.rollback();
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int reservationPaymentDelete(int resNo) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int rentalDelete = new ReservationDao().reservationRentalDelete(conn, resNo);	
		if(rentalDelete > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		int result = new ReservationDao().reservationPaymentDelete(conn, resNo);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Reservation> reservationViewList(String memberId) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ReservationDao().reservationViewList(conn, memberId);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public ReservationViewPageData reservationView(int resNo) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Reservation res = new ReservationDao().reservationResView(conn, resNo);
		Branch b = new ReservationDao().reservationBranch(conn, res.getResBCode());
		Court c = new ReservationDao().reservationCourtView(conn, res.getResCCode());
		ArrayList<Rental> rList = new ReservationDao().reservationRentalView(conn, res.getResNo());
		ArrayList<Goods> gList = null;
		if(!rList.isEmpty()) {
			gList = new ArrayList<Goods>();
			for(int i=0;i<rList.size();i++) {
				Goods g = new ReservationDao().reservationRentalGoods(conn, rList.get(i).getRentalGNo());
				gList.add(g);
			}
		}
		JDBCTemplate.close(conn);
		return new ReservationViewPageData(res,b,c,rList,gList);
	}
	
	public int reservationCancelApply(int resNo, String cancelApplyDate) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().reservationCancelApply(conn, resNo, cancelApplyDate);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int reservationCancelApplyRollback(int resNo, String payDate) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().reservationCancelApplyRollback(conn, resNo, payDate);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public ArrayList<Reservation> reservationManagerList() throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Reservation> list = new ReservationDao().reservationManagerList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int reservationPaymentCancelAllow(int resNo, String date) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		//스케쥴 가능으로 변경
		int schedule = new ReservationDao().reservationScheduleStatusSet(conn, resNo);
		if(schedule > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		//물품 재고 증가
		ArrayList<Rental> rList = new ReservationDao().reservationRentalView(conn, resNo);
		for(int i=0;i<rList.size();i++) {
			//렌탈 테이블에 물품 저장을 완료하면 주문한 물품의 고유번호를 이용하여 해당 물품의 재고를 나간 만큼 줄임(물품번호,주문 수량 필요)
			int goodsUpdate = new ReservationDao().reservationGoodsAmountSet(conn,rList.get(i).getRentalGNo(),rList.get(i).getRentalGAmount());
			if(goodsUpdate > 0) {
				conn.commit();
			}else {
				conn.rollback();
			}
		}
		//물품 대여 내역 삭제
/*		
		int rentalDelete = new ReservationDao().reservationRentalDelete(conn, resNo);	
		if(rentalDelete > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
*/
		//대관 내역 변경
		int result = new ReservationDao().reservationPaymentCancelAllow(conn, resNo, date);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int reservationManagerGoodsAdd(int bCode, String goodsCategory, String goodsName, String goodsSize, int goodsPrice, int goodsAmount) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int goodsCount = new ReservationDao().reservationGoodsCount(conn, goodsName, goodsSize, bCode);
		if(goodsCount > 0) {
			JDBCTemplate.close(conn);
			return 0;
		}else {
			int result = new ReservationDao().reservationManagerGoodsAdd(conn, bCode, goodsCategory, goodsName, goodsSize, goodsPrice, goodsAmount);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result;
		}
	}
	
	public int reservationManagerGoodsDelete(int bCode, String goodsName, String goodsSize) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int count = new ReservationDao().reservationGoodsRentalCount(conn, bCode, goodsName, goodsSize);
		if(count > 0) {
			JDBCTemplate.close(conn);
			return 0;
		}else {
			int result = new ReservationDao().reservationManagerGoodsDelete(conn,bCode,goodsName, goodsSize);
			if(result > 0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
			JDBCTemplate.close(conn);
			return result;
		}
	}
	
	public ArrayList<Goods> reservationGoodsNameList(int bCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Goods> list = new ReservationDao().reservationGoodsNameList(conn, bCode);
		JDBCTemplate.close(conn);
		return list;
	}
	
	public int reservationManagerGoodsAmountModify(int bCode, String goodsName, String goodsSize, int goodsAmount) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().reservationManagerGoodsAmountModify(conn, bCode, goodsName, goodsSize, goodsAmount);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	public int reservationManagerGoodsPriceModify(int bCode, String goodsName, String goodsSize, int goodsPrice) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new ReservationDao().reservationManagerGoodsPriceModify(conn, bCode, goodsName, goodsSize, goodsPrice);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
