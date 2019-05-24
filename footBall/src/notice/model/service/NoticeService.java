package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticeVo;

public class NoticeService {
	public NoticePageData NoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new NoticeDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage + 1;
		int end = reqPage*numPerPage;
		ArrayList<NoticeVo> list = new NoticeDao().NoticeList(conn,start,end);
		String pageNavi = "";
		int pageNaviSize=10;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {
			pageNavi +="<a class='btn' href='/boardList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/boardList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='boardList?reqPage"+pageNo+"'>다음</a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
}
