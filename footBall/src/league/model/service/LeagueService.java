package league.model.service;

import java.sql.Connection;
import java.sql.SQLException;

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
}