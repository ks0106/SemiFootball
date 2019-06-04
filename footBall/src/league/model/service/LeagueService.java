package league.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.dao.LeagueDao;
import league.model.vo.League;
import league.model.vo.WinList;

public class LeagueService {
	public int insertTeam(League t) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().insertTeam(conn, t);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public WinList teamList() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<League> allList = new LeagueDao().teamList(conn);
		ArrayList<League> win4List = new LeagueDao().win4List(conn);
		ArrayList<League> win2List = new LeagueDao().win2List(conn);
		WinList list = new WinList(win2List, win4List, allList);
		JDBCTemplate.close(conn);
		return list;
	}

	public int setGame() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().setGame(conn);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int matchUp1(ArrayList<Integer> teamNo4) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		for(int i= 0 ; i<teamNo4.size();i++) {
			result = new LeagueDao().win4(conn, teamNo4.get(i));
		}
		if (result > 0) {
			JDBCTemplate.commit(conn);
			} else {
				JDBCTemplate.rollback(conn);
			}
		return result;
	}
	public int matchUp2(ArrayList<Integer> teamNo2) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = 0;
		for(int i= 0 ; i<teamNo2.size();i++) {
			result = new LeagueDao().win2(conn, teamNo2.get(i));
		}
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public int matchUp3(int top1) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().top1(conn, top1);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public int countTeam() {
		Connection conn = JDBCTemplate.getConnection();
		int cnt = new LeagueDao().countTeam(conn);
		JDBCTemplate.close(conn);
		return cnt;
	}
	public int removeTeam(String teamEmail) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new LeagueDao().removeTeam(conn,teamEmail);
		if (result > 0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	
	}
}
