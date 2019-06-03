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
			l.setTeamNo(rset.getInt("team_no"));
			l.setTeamName(rset.getString("team_name"));
			l.setTeamRep(rset.getString("team_rep"));
			l.setTeamPhone(rset.getString("team_Phone"));
			l.setTeamEmail(rset.getString("team_email"));
			l.setTeamColorHome(rset.getString("team_color_home"));
			l.setTeamColorAway(rset.getString("team_color_away"));
			l.setFilepath(rset.getString("filepath"));
			l.setTeamTableLevel(rset.getInt("team_table_level"));
			l.setMatch1(rset.getInt("match1"));
			l.setMatch2(rset.getInt("match2"));
			l.setMatch3(rset.getInt("match3"));
			list.add(l);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	
	public int setGame(Connection conn ) throws SQLException {
		Statement stmt= null;
		int result = 0;
		String query = "update fb_team set team_table_level =0,match1= 0,match2= 0,match3= 0";
		stmt = conn.createStatement();
		result = stmt.executeUpdate(query);
		JDBCTemplate.close(stmt);
		return result;
	}
	public int win4(Connection conn , int[] teamNo) throws SQLException {
		PreparedStatement pstmt =null;
		int result = 0;
		String query="update fb_team set match1= 1 where team_no in (?,?,?,?)";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, teamNo[0]);
		pstmt.setInt(2, teamNo[1]);
		pstmt.setInt(3, teamNo[2]);
		pstmt.setInt(4, teamNo[3]);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public ArrayList<League> win4List(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<League> list = new ArrayList<League>();
		String query="select * from(select rownum as rnum, t.* from (select * from fb_team where match1=1 order by 1)t) where rnum between 1 and 8";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		while(rset.next()) {
			League l = new League();
			l.setTeamNo(rset.getInt("team_no"));
			l.setTeamName(rset.getString("team_name"));
			l.setTeamRep(rset.getString("team_rep"));
			l.setTeamPhone(rset.getString("team_Phone"));
			l.setTeamEmail(rset.getString("team_email"));
			l.setTeamColorHome(rset.getString("team_color_home"));
			l.setTeamColorAway(rset.getString("team_color_away"));
			l.setFilepath(rset.getString("filepath"));
			l.setTeamTableLevel(rset.getInt("team_table_level"));
			l.setMatch1(rset.getInt("match1"));
			l.setMatch2(rset.getInt("match2"));
			l.setMatch3(rset.getInt("match3"));
			list.add(l);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	public ArrayList<League> win2List(Connection conn) throws SQLException{
		Statement stmt = null;
		ResultSet rset = null;
		ArrayList<League> list = new ArrayList<League>();
		String query="select * from(select rownum as rnum, t.* from (select * from fb_team where match2=1 order by 1)t) where rnum between 1 and 8";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		while(rset.next()) {
			League l = new League();
			l.setTeamNo(rset.getInt("team_no"));
			l.setTeamName(rset.getString("team_name"));
			l.setTeamRep(rset.getString("team_rep"));
			l.setTeamPhone(rset.getString("team_Phone"));
			l.setTeamEmail(rset.getString("team_email"));
			l.setTeamColorHome(rset.getString("team_color_home"));
			l.setTeamColorAway(rset.getString("team_color_away"));
			l.setFilepath(rset.getString("filepath"));
			l.setTeamTableLevel(rset.getInt("team_table_level"));
			l.setMatch1(rset.getInt("match1"));
			l.setMatch2(rset.getInt("match2"));
			l.setMatch3(rset.getInt("match3"));
			list.add(l);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	public int win2(Connection conn , int[] teamNo) throws SQLException {
		PreparedStatement pstmt =null;
		int result = 0;
		String query="update fb_team set match2= 1 where team_no in (?,?)";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, teamNo[0]);
		pstmt.setInt(2, teamNo[1]);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int top1(Connection conn , int top1) throws SQLException {
		PreparedStatement pstmt =null;
		int result = 0;
		String query="update fb_team set match3= 1 where team_no=?";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, top1);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
}
