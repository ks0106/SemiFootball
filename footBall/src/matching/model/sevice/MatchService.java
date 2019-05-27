package matching.model.sevice;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.dao.MatchDao;
import matching.model.vo.MatchList;
import matching.model.vo.MatchPageData;

public class MatchService {
	public MatchPageData selectList(int reqPage) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new MatchDao().countList(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<MatchList> list= new MatchDao().selectList(conn,start,end);
		
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/matching?reqPage=1'><<</a>";
			pageNavi += "<a class='btn' href='/matching?reqPage="+(pageNo-1)+"'><</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/matching?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/matching?reqPage="+pageNo+"'>></a>";
			pageNavi += "<a class='btn' href='/matching?reqPage="+totalPage+"'>>></a>";
			
		}
		
		JDBCTemplate.close(conn);
		MatchPageData mpd = new MatchPageData(pageNavi,list);
		return mpd;
	}
	
}
