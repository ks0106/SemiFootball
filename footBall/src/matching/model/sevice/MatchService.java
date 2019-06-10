package matching.model.sevice;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import league.model.vo.AfterLeague;
import matching.model.dao.MatchDao;
import matching.model.vo.MatchList;
import matching.model.vo.MatchPageData;
import matching.model.vo.Recruit;

public class MatchService {
	public MatchPageData selectList(int reqPage) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new MatchDao().countList(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<MatchList> list= new MatchDao().selectList(conn,start,end);
		for(int i = 0 ; i<list.size();i++) {
			list.get(i).setTeamCount((list.get(i).getMatchAmount()));
		}
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/matching?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/matching?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/matching?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		MatchPageData mpd = new MatchPageData(pageNavi,list);
		return mpd;
	}
	public MatchList selectOne(int pageNum) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		MatchList m = new MatchDao().selectOne(conn,pageNum);
		m.setDate(m.getMatchDate());
		m.setTeamCount(m.getMatchAmount());
		m.setAble(m.getMatchAble());
		JDBCTemplate.close(conn);
		return m;
	}
	public MatchPageData searchList(int reqPage,int branch , String keyword) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new MatchDao().searchCount(conn,branch,keyword);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<MatchList> list= new MatchDao().searchList(conn,start,end,branch,keyword);
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/matchSearch?branch=동대문지점&keyword=홍길동&reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/matchSearch?branch=동대문지점&keyword=홍길동&reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/matchSearch?branch=동대문지점&keyword=홍길동&reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		MatchPageData mpd = new MatchPageData(pageNavi,list);
		return mpd;
	}
	public int mercenaryAdd(Recruit r) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MatchDao().mercenaryAdd(conn, r);
		if(result > 0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return 0;
	}
	
	public int addMatchList(MatchList m) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MatchDao().addMatchList(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public int modiMatchContent(MatchList m) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MatchDao().modiMatchContent(conn , m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
