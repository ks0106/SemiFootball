package league.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import common.JDBCTemplate;
import league.model.vo.League;

public class LeagueDao {

	public int insertTeam(Connection conn , League t) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_team values(seq_team_no.nextval,?,?,?,?,?,?,?)";
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, t.getTeamName());
			pstmt.setString(2, t.getTeamRep());
			pstmt.setString(3,t.getTeamPhone());
			pstmt.setString(4, t.getTeamEmail());
			pstmt.setString(5, t.getTeamColorHome());
			pstmt.setString(6, t.getTeamColorAway());
			pstmt.setString(7, t.getFilepath());
			result = pstmt.executeUpdate();
		return result;
		
	}
}
