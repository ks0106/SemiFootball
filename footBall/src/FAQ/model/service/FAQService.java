package FAQ.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import FAQ.model.dao.FAQDao;
import FAQ.model.vo.FAQPageData;
import FAQ.model.vo.FAQVo;
import common.JDBCTemplate;


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
			pageNavi += "<a class='btn' href='/fAQ?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/fAQ?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/fAQ?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
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
		return result;
	}
	//FAQ하나의 정보 가져오기
	public FAQVo listOne(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		FAQVo fv = null;
		fv = new FAQDao().listOne(conn,faqNo);
		JDBCTemplate.close(conn);
		return fv;
	}
	//FAQ 삭제
	public int faqDelete(int faqNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new FAQDao().faqDelete(conn, faqNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
