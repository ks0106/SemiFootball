package league.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.vo.League;

public class LeagueDao {

	public int insertTeam(Connection conn , League t) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_team values(seq_team_no.nextval,?,?,?,?,?,?,?,0)";
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
	public ArrayList<League> teamList(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<League> list = new ArrayList<League>();
		String query="select * from(select rownum as rnum, t.* from (select * from fb_team order by 1)t) where rnum between 1 and 8";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		while(rset.next()) {
			League l = new League();
			l.setTeamName(rset.getString("team_name"));
			l.setTeamRep(rset.getString("team_rep"));
			l.setTeamPhone(rset.getString("team_Phone"));
			l.setTeamEmail(rset.getString("team_email"));
			l.setTeamColorHome(rset.getString("team_color_home"));
			l.setTeamColorAway(rset.getString("team_color_away"));
			l.setFilepath(rset.getString("filepath"));
			l.setTeamTableLevel(rset.getInt("team_table_level"));
			list.add(l);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
}
