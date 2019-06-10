package matching.model.sevice;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import matching.model.dao.MatchDao;
import matching.model.dao.RecDao;
import matching.model.vo.MatchList;
import matching.model.vo.MatchPageData;
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
		for(int i = 0 ; i<list.size();i++) {
			list.get(i).setAmount2(list.get(i).getAmount());
			list.get(i).setAble2(list.get(i).getRecAble());
			list.get(i).setDate2(list.get(i).getRecDate());
		}
		
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
	public Recruit selectOne(int pageNum) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Recruit r = new RecDao().selectOne(conn , pageNum);
		r.setAmount2(r.getAmount());
		r.setAble2(r.getRecAble());
		r.setDate2(r.getRecDate());
		JDBCTemplate.close(conn);
		return r;
		
	}
	public int addMerRec(Recruit r) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new RecDao().addMerRec(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public int modiRecContent(Recruit r) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new RecDao().modiRecContent(conn,r);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public RecPageData searchList(int reqPage, int branch, String keyword) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount= new RecDao().searchCount(conn,branch,keyword);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Recruit> list= new RecDao().searchList(conn,start,end,branch,keyword);
		for(int i = 0 ; i<list.size();i++) {
			list.get(i).setAmount2(list.get(i).getAmount());
			list.get(i).setAble2(list.get(i).getRecAble());
			list.get(i).setDate2(list.get(i).getRecDate());
		}
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/recSearch?branch"+branch+"&keyword="+keyword+"&reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/recSearch?branch"+branch+"&keyword="+keyword+"&reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/recSearch?branch"+branch+"&keyword="+keyword+"&reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		RecPageData rpd = new RecPageData(list, pageNavi);
		return rpd;
	
	}
	
	public RecPageData selectList2(int reqPage) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage=10;
		int totalCount2= new RecDao().countList2(conn);
		int totalPage = (totalCount2%numPerPage==0)?(totalCount2/numPerPage):(totalCount2/numPerPage)+1;
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Recruit> list2= new RecDao().selectList2(conn,start,end);
		for(int i = 0 ; i<list2.size();i++) {
			list2.get(i).setAmount2(list2.get(i).getAmount());
			list2.get(i).setAble2(list2.get(i).getRecAble());
			list2.get(i).setDate2(list2.get(i).getRecDate());
		}
		String pageNavi ="";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		
		if(pageNo!=1) {
			pageNavi += "<a class='btn' href='/mercenary?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize||pageNo>totalPage)) {
			if(reqPage==pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>";
			}else {
				pageNavi +="<a class='btn' href='/mercenary?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/mercenary?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
			
		}
		
		JDBCTemplate.close(conn);
		RecPageData rpd = new RecPageData(list2, pageNavi);
		return rpd;
	}
}
