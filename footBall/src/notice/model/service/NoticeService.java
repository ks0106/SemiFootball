package notice.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import common.JDBCTemplate;
import notice.model.dao.NoticeDao;
import notice.model.vo.NoticePageData;
import notice.model.vo.NoticeVo;

public class NoticeService {
	//페이징처리 전체 리스트
	public NoticePageData NoticeList(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		//페이지 당 게시물 수
		int numPerPage = 10;
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
			pageNavi += "<a class='btn' href='/notice?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		//페이지 번호 버튼 생성 ( 1 2 3 4 5 )
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/notice?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/notice?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	
	public NoticePageData NoticeList1(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		//페이지 당 게시물 수
		int numPerPage = 10;
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
			pageNavi += "<a class='btn' href='/noticeDeletePage?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		//페이지 번호 버튼 생성 ( 1 2 3 4 5 )
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) {
			if(reqPage == pageNo) {
				pageNavi += "<div class='pageNaviBtn selectPage'><span>"+pageNo+"</span></div>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/noticeDeletePage?reqPage="+pageNo+"'><div class='pageNaviBtn'>"+pageNo+"</div></a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
		pageNavi +="<a class='btn' href='/noticeDeletePage?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	
	
	//하나의 게시물보기
	public NoticeVo listOne(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		NoticeVo nv = null;
		int result = new NoticeDao().noticeHit(conn,noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);		
			nv = new NoticeDao().listOne(conn,noticeNo);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return nv;
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
	
	//게시물 삭제
	public int noticeDelete(int noticeNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new NoticeDao().noticeDelete(conn, noticeNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//검색기능
	public NoticePageData searchKeyword(int reqPage, String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = 0;
		int totalPage = 0;
		int start = 0;
		int end = 0;
		ArrayList<NoticeVo> list = null;
		totalCount = new NoticeDao().titleCount(conn,keyword);
		totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		start = (reqPage-1)*numPerPage+1;
		end = reqPage*numPerPage;
		list = new NoticeDao().searchKeywordTitle(conn,start,end,keyword);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi+="<a class='pageNaviBtn' style='margin:10px;' href='/searchKeywordNotice?reqPage="+(pageNo-1)+"&keyword="+keyword+"'>이전</a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage pageNaviBtn' style='margin:10px;'>"+pageNo+"</span>"; //보고있는 페이지는 누를수 없게 하기
			}else {
				pageNavi += "<a class='pageNaviBtn' style='margin:10px;' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
			pageNavi +="<a class='pageNaviBtn' style='margin:10px;' href='/searchKeyword?reqPage="+pageNo+"&keyword="+keyword+"'>다음</a>";
		}
		NoticePageData pd = new NoticePageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return pd;
		}
}
