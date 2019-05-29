package matching.model.sevice;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.dao.RecDao;
import matching.model.vo.RecPageData;
import matching.model.vo.Recruit;

public class RecService {
	public RecPageData selectList(int reqPage) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new RecDao().countList(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Recruit> list= new RecDao().selectList(conn,start,end);
		
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/mercenaryRec?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/mercenaryRec?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/mercenaryRec?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		RecPageData rpd = new RecPageData(list, pageNavi);
		return rpd;
	}
}
