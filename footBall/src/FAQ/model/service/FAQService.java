package FAQ.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import FAQ.model.dao.FAQDao;
import FAQ.model.vo.FAQPageData;
import FAQ.model.vo.FAQVo;
import common.JDBCTemplate;
import notice.model.dao.NoticeDao;

public class FAQService {
	//FAQ작성
	public int insert(FAQVo fv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FAQDao().insert(conn,fv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	//FAQ리스트
	public FAQPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new FAQDao().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		ArrayList<FAQVo> list = new FAQDao().selectList(conn,start,end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {
			pageNavi += "<a class='btn' href='/fAQ?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>"; //보고있는 페이지는 누를수 없게 하기
			}else {
				pageNavi += "<a class='btn' href='/fAQ?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/fAQ?reqPage="+pageNo+"'>다음</a>";
		}
		FAQPageData pd = new FAQPageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	//FAQ수정
	public int faqUpdate(FAQVo fv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FAQDao().faqUpdate(conn,fv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		System.out.println(result+"service");
		return result;
	}
}
