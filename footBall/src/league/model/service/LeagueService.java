package league.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.dao.LeagueDao;
import league.model.vo.League;

public class LeagueService {
	public int insertTeam(League t) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().insertTeam(conn , t);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public ArrayList<League> teamList() throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<League> list = new LeagueDao().teamList(conn);
		JDBCTemplate.close(conn);
		return list;
	}
	public int winner(int teamNo) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().winner(conn,teamNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int setGame() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().setGame(conn);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
