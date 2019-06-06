package league.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.vo.AfterLeague;
import league.model.vo.AfterTeam;
import league.model.vo.League;
import league.model.vo.LeagueList;

public class LeagueDao {

	public int insertTeam(Connection conn , League t) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_team values(seq_team_no.nextval,?,?,?,?,?,?,default,default,default,?)";
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
		String query = "update fb_team set match1= 0,match2= 0,match3= 0";
		stmt = conn.createStatement();
		result = stmt.executeUpdate(query);
		JDBCTemplate.close(stmt);
		return result;
	}
	public int win4(Connection conn , int teamNo) throws SQLException {
		PreparedStatement pstmt =null;
		int result = 0;
		String query="update fb_team set match1= 1 where team_no = ?";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, teamNo);
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
			l.setMatch1(rset.getInt("match1"));
			l.setMatch2(rset.getInt("match2"));
			l.setMatch3(rset.getInt("match3"));
			list.add(l);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}
	public int win2(Connection conn , int teamNo) throws SQLException {
		PreparedStatement pstmt =null;
		int result = 0;
		String query="update fb_team set match2= 1 where team_no =?";
		pstmt=conn.prepareStatement(query);
		pstmt.setInt(1, teamNo);
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
	public int countTeam(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		int cnt = 0;
		String query = "select count(*) as cnt from fb_team";
		try {
			stmt= conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				cnt = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return cnt;
	}
	public int removeTeam(Connection conn , String teamEmail) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from fb_team where team_Email=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, teamEmail);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int countLeague(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset= null;
		int result = 0;
		String query ="select count(*) cnt from fb_after_league";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			result = rset.getInt("cnt");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return result;
	}
	public ArrayList<AfterLeague> afterLeagueList(Connection conn , int start , int end) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AfterLeague> list = new ArrayList<AfterLeague>();
		String query = "select * from (select ROWNUM as rn , t.* from (select * from (select ROWNUM as rNum,m.* from (select * from fb_after_league order by league_after_no ) m)order by 1 desc) t ) where rn between ? and?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, start);
		pstmt.setInt(2, end);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			AfterLeague al = new AfterLeague();
			al.setLeagueAfterNo(rset.getInt("rnum"));
			al.setLeagueAfterTitle(rset.getString("league_after_title"));
			al.setLeagueAfterWriter(rset.getString("league_after_writer"));
			al.setLeagueAfterEnrolldate(rset.getDate("league_after_enrolldate"));
			al.setLeagueNo(rset.getInt("league_no"));
			al.setFilepath(rset.getString("filepath"));
			list.add(al);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}
	public LeagueList nowLeague(Connection conn) throws SQLException {
		Statement stmt = null;
		ResultSet rset = null;
		LeagueList ll = null;
		String query = "select * from fb_league";
		stmt=conn.createStatement();
		rset = stmt.executeQuery(query);
		if(rset.next()) {
			ll = new LeagueList();
			ll.setLeagueNo(rset.getInt("league_no"));
			ll.setLeagueTitle(rset.getString("league_title"));
			ll.setLeagueWriter(rset.getString("league_writer"));
			ll.setLeagueEnrolldate(rset.getDate("league_enrolldate"));
			ll.setFilepath(rset.getString("filepath"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return ll;
	}
	public int addLeague(Connection conn , LeagueList ll) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_league values(seq_fb_league.nextval,?,?,sysdate,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ll.getLeagueTitle());
		pstmt.setString(2, ll.getLeagueWriter());
		pstmt.setString(3,ll.getFilepath());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int deleteLeague(Connection conn , int leagueNo) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "delete from fb_league where league_no=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1,leagueNo );
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int addAfterLeague(Connection conn , LeagueList ll, int leagueNo) throws SQLException {
		PreparedStatement pstmt = null;
		int result = 0;
		String query = "insert into fb_after_league values(seq_fb_after_league.nextval,?,?,sysdate,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, ll.getLeagueTitle());
		pstmt.setString(2, ll.getLeagueWriter());
		pstmt.setInt(3, leagueNo);
		pstmt.setString(4,ll.getFilepath());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int addAfterTeam(Connection conn , League team ,int leagueNo ) throws SQLException {
		PreparedStatement pstmt = null;
		int result =0;
		String query = "insert into fb_after_team values(?,?,?,?,?,?)";
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1,team.getTeamName());
		pstmt.setString(2, team.getFilepath());
		pstmt.setInt(3, leagueNo);
		pstmt.setInt(4, team.getMatch1());
		pstmt.setInt(5, team.getMatch2());
		pstmt.setInt(6, team.getMatch3());
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int deleteTeam(Connection conn) throws SQLException {
		Statement stmt = null;
		int result = 0;
		String query = "delete from fb_team";
		stmt = conn.createStatement();
		result = stmt.executeUpdate(query);
		JDBCTemplate.close(stmt);
		return result;
	}
	public ArrayList<AfterTeam> afterteamList(Connection conn,int leagueNo) throws SQLException{
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		ArrayList<AfterTeam> list = new ArrayList<AfterTeam>();
		String query = "select * from fb_after_team where league_no = ?";
		pstmt =conn.prepareStatement(query);
		pstmt.setInt(1, leagueNo);
		rset = pstmt.executeQuery();
		while(rset.next()) {
			AfterTeam at = new AfterTeam();
			at.setTeamName(rset.getString("team_name"));
			at.setleagueNo(rset.getInt("league_No"));
			at.setFilepath(rset.getString("filepath"));
			at.setMatch1(rset.getInt("match1"));
			at.setMatch2(rset.getInt("match2"));
			at.setMatch3(rset.getInt("match3"));
			list.add(at);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
		
	}
	public AfterLeague afterLeagueSelect(Connection conn , int leagueNo) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		AfterLeague al = null;
		String query ="select * from fb_after_league where league_No=?";
		pstmt = conn.prepareStatement(query);
		pstmt.setInt(1, leagueNo);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			al = new AfterLeague();
			al.setFilepath(rset.getString("filepath"));
			al.setLeagueAfterTitle(rset.getString("league_after_title"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return al;
	}
}
