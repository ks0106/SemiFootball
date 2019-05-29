package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticeViewData;
import notice.model.vo.NoticeVo;

public class NoticeService {
	//페이징처리 전체 리스트
	public NoticePageData NoticeList(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		//페이지 당 게시물 수
		int numPerPage = 5;
		//총 게시물 수 구하기
		int totalCount = new NoticeDao().totalCount(conn);
		//총 페이지 수 구하기
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//요청 페이지의 시작 게시물 번호와 끝 게시물 번호 구하기
		//시작 게시물 번호
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		ArrayList<NoticeVo> list = new NoticeDao().NoticeList(conn,start,end);
		//페이지 네비 작성
		String pageNavi = "";
		//페이지 네비의 수
		int pageNaviSize = 5;
		//페이지 번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//이전 버튼 생성
		if(pageNo !=1) {
			pageNavi += "<a class='btn' href='/notice?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		//페이지 번호 버튼 생성 ( 1 2 3 4 5 )
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>"; //보고있는 페이지는 누를수 없게 하기
			}else {
				pageNavi += "<a class='btn' href='/notice?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/notice?reqPage="+pageNo+"'>다음</a>";
		}
		NoticePageData bpd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}
	
	//하나의 게시물보기
	public NoticeViewData listOne(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		NoticeVo nv = new NoticeDao().listOne(conn,noticeNo);
		NoticeViewData nvd = new NoticeViewData(nv);
		JDBCTemplate.close(conn);
		return nvd;
	}
	
	//게시물등록
	public int noticeInsert(NoticeVo nv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().noticeInsert(conn,nv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//게시물 수정
	public int noticeUpdate(NoticeVo nv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().noticeUpdate(conn,nv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
