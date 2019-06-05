package board.model.service;

import java.sql.Connection;
import java.util.ArrayList;

import board.model.dao.BoardDao;
import board.model.vo.BoardComment;
import board.model.vo.BoardPageData;
import board.model.vo.BoardViewData;
import board.model.vo.BoardVo;
import common.JDBCTemplate;

public class BoardService {
	//페이징처리 후 리스트보기
	public BoardPageData boardList(int reqPage){
		Connection conn = JDBCTemplate.getConnection();
		//페이지 당 게시물 수
		int numPerPage = 10;
		//총 게시물 수 구하기
		int totalCount = new BoardDao().totalCount(conn);
		//총 페이지 수 구하기
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
		//요청 페이지의 시작 게시물 번호와 끝 게시물 번호 구하기
		//시작 게시물 번호
		int start = (reqPage-1)*numPerPage +1;
		int end = reqPage*numPerPage;
		ArrayList<BoardVo> blist = new BoardDao().boardList(conn,start,end);
		//페이지 네비 작성
		String pageNavi = "";
		//페이지 네비의 수
		int pageNaviSize = 5;
		//페이지 번호
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		//이전 버튼 생성
		if(pageNo !=1) {
			pageNavi += "<a class='btn' href='/boardList?reqPage="+(pageNo-1)+"'>이전</a>";
		}
		//페이지 번호 버튼 생성 ( 1 2 3 4 5 )
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/boardList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/boardList?reqPage="+pageNo+"'>다음</a>";
		}
		BoardPageData bpd = new BoardPageData(blist,pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}
	
	//하나의 게시물 보기
	public BoardViewData listOne(int boardNo){
		Connection conn = JDBCTemplate.getConnection();
		BoardVo bv = new BoardDao().listOne(conn,boardNo);
		if(bv!=null) {
			int result = new BoardDao().boardHit(conn, boardNo);
			if(result>0) {
				JDBCTemplate.commit(conn);
			}else {
				JDBCTemplate.rollback(conn);
			}
		}
		ArrayList<BoardComment> list = new BoardDao().selectCommentList(conn,boardNo);
		BoardViewData bvd = new BoardViewData(list,bv);
		JDBCTemplate.close(conn);
		return bvd;
	}
	
	//글작성
	public int boardInsert(BoardVo bv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().boardInsert(conn,bv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//글수정
	public int boardUpdate(BoardVo bv) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().boardUpdate(conn,bv);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//글삭제
	public int boardDelete(int boardNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().boardDelete(conn,boardNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//댓글작성
	public int insertBoardComment(BoardComment bc) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().insertBoardComment(conn, bc);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//댓글수정
	public int updateBoardComment(int boardCommentNo, String boardCommentContent) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().updateBoardComment(conn, boardCommentNo,boardCommentContent);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//댓글삭제
	public int boardCommentDelete(int boardCommentNo) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BoardDao().boardCommentDelete(conn,boardCommentNo);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	
	//검색기능
	public BoardPageData searchKeyword(int reqPage,String type,String keyword) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount=0;
		int totalPage = 0;
		int start = 0;
		int end = 0;
		ArrayList<BoardVo> list = null;
		switch(type) {
		case "boardTitle":
			totalCount = new BoardDao().titleCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage+1;
			end = reqPage*numPerPage;
			list = new BoardDao().searchKeywordBoardTitle(conn,start,end,keyword);
			break;
		case "boardWriter":
			totalCount = new BoardDao().writerCount(conn,keyword);
			totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1;
			start = (reqPage-1)*numPerPage+1;
			end = reqPage*numPerPage;
			list = new BoardDao().searchKeywordBoardWriter(conn,start,end,keyword);
			break;
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo!=1) {
			pageNavi+="<a class='btn' href='/searchKeyword?reqPage="+(pageNo-1)+"&type="+type+"&keyword="+keyword+"'>이전</a>";
		}
		int i = 1;
		while( !(i++>pageNaviSize || pageNo>totalPage) ) { //둘 중 하나라도 만족하면 수행하지 않겠다
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>"; //4페이지 상태에서 4페이지를 누를수가 없도록 하기 위해서 a태그 없애줌 
			}else {
				pageNavi += "<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		//다음 버튼 생성
		if(pageNo <= totalPage) {
			pageNavi +="<a class='btn' href='/searchKeyword?reqPage="+pageNo+"&type="+type+"&keyword="+keyword+"'>다음</a>";
		}
		BoardPageData bpd = new BoardPageData(list,pageNavi);
		JDBCTemplate.close(conn);
		return bpd;
	}	
}
