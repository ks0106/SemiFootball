package reservation.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.vo.Branch;
import common.JDBCTemplate;
import reservation.model.dao.ReservationDao;
import reservation.model.vo.Court;

public class ReservationService {
	public ArrayList<Branch> reservationBranch() throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Branch> list = new ReservationDao().reservationBranch(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public ArrayList<Court> reservationCourt(int rCode) throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Court> list = new ReservationDao().reservationCourt(conn,rCode);
		JDBCTemplate.close(conn);
		return list;
	}

}
