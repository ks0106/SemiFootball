package league.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.dao.LeagueDao;
import league.model.vo.AfterLeague;
import league.model.vo.League;
import league.model.vo.LeagueList;
import league.model.vo.LeaguePageData;
import league.model.vo.WinList;
import matching.model.dao.MatchDao;
import matching.model.vo.MatchList;
import matching.model.vo.MatchPageData;

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
	public LeaguePageData LeaguePage(int reqPage) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new LeagueDao().countLeague(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<AfterLeague> list= new LeagueDao().afterLeagueList(conn,start,end);
		LeagueList ll = new LeagueDao().nowLeague(conn);
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/league?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/league?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/league?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		LeaguePageData lpd = new LeaguePageData(list, ll, pageNavi);
		return lpd;
	}
	
}
