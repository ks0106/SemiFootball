package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticeViewData;
import notice.model.vo.NoticeVo;

public class NoticeService {
	//페이징처리 전체리스트
	public NoticePageData NoticeList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 5;
		int totalCount = new NoticeDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage + 1;
		int end = reqPage*numPerPage;
		ArrayList<NoticeVo> list = new NoticeDao().NoticeList(conn,start,end);
		String pageNavi = "";
		int pageNaviSize=5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {
			pageNavi +="<a class='btn' href='/notice?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi +="<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi +="<a class='btn' href='/notice?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class='btn' href='/notice?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	
	//하나의 게시물 보기
	public NoticeViewData ListOne(int seqNoticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		NoticeVo nv = new NoticeDao().ListOne(conn, seqNoticeNo);
		NoticeViewData nvd = new NoticeViewData(nv);
		JDBCTemplate.close(conn);
		return nvd;
	}
}
