package member.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import common.JDBCTemplate;
import member.model.dao.MemberDAO;
import member.model.vo.Member;
import member.model.vo.MemberPageData;

public class MemberService {
	public Member login(String id,String pwd)throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new  MemberDAO().login(conn,id,pwd);
		JDBCTemplate.close(conn);
		return m;
	}
	public int insert(Member m)throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDAO().insert(conn,m);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
	public Member kakaosearchId(String id,String name) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDAO().kakaosearchId(conn,id);
		if(m!=null) {
			JDBCTemplate.close(conn);
			return m;			
		}else {
			
			int result = new MemberDAO().kakaoInsert(conn,id,name);
			if(result>0) {
				m = new MemberDAO().kakaosearchId(conn,id);
				JDBCTemplate.close(conn);
				return m;
			}else {
				return m;
			}
		}
		
	}
	public String searchId(String name , String pwdHint, String pwdHintAnswer)throws SQLException {
		Connection conn =JDBCTemplate.getConnection();
		String id = new MemberDAO().searchId(conn,name,pwdHint,pwdHintAnswer);
		JDBCTemplate.close(conn);
		return id ;
	}
	public String searchPwd(String id, String name)throws SQLException {
		Connection conn =JDBCTemplate.getConnection();
		String id1 = new MemberDAO().searchPwd(conn,id,name);
		JDBCTemplate.close(conn);
		return id1;
	}
	public int researchPwd(String id , String rePwd)throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDAO().researchPwd(conn,id,rePwd);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	public Member printAll(String id)throws SQLException{
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDAO().printAll(conn,id);
		JDBCTemplate.close(conn);
		return m ;
	}
	public int updateMember(String id,String pwd,String pwdHint,String pwdHintAnswer,String phone) throws SQLException{
		Connection conn =JDBCTemplate.getConnection();
		int result = new MemberDAO().updateMember(conn,id,pwd,pwdHint,pwdHintAnswer,phone);
		if(result>0) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		return result;
	}
	
	public MemberPageData selectList(int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = new MemberDAO().totalCount(conn);
		int totalPage = (totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1; 
		int start = (reqPage-1)*numPerPage + 1;
		int end = reqPage*numPerPage;
		ArrayList<Member> list = new MemberDAO().selectList(conn, start, end);
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo !=1) {
			pageNavi += "<a class='pageNaviBtn' href='/memberList?reqPage="+(pageNo-1)+"'><div class='pageNaviBtn'>&lt</div></a>";
		}
		int i=1;
		while(!(i++ > pageNaviSize || pageNo > totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='pageNaviBtn selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class ='pageNaviBtn' href='/memberList?reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class ='pageNaviBtn' href='/memberList?reqPage="+pageNo+"'><div class='pageNaviBtn'>&gt</div></a>";
		}
		MemberPageData pd = new MemberPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	
	public MemberPageData searchKeyword(String type, String keyword, int reqPage) {
		Connection conn = JDBCTemplate.getConnection();
		int numPerPage = 10;
		int totalCount = 0;
		switch(type) {
		case "memberId": totalCount = new MemberDAO().totalCount2(conn, keyword); break;	
		case "memberName": totalCount = new MemberDAO().totalCount3(conn, keyword); break;
		}
		int totalPage = ((totalCount%numPerPage==0)?(totalCount/numPerPage):(totalCount/numPerPage)+1);
		int start = (reqPage-1)*numPerPage+1;
		int end = reqPage*numPerPage;
		ArrayList<Member> list = null;
		switch(type) {
			case "memberId": list = new MemberDAO().searchKeywordId(conn,keyword,start, end);break;
			case "memberName": list = new MemberDAO().searchKeywordName(conn, keyword,start, end);break;
		}
		String pageNavi = "";
		int pageNaviSize = 5;
		int pageNo = ((reqPage-1)/pageNaviSize)*pageNaviSize+1;
		if(pageNo != 1) {
			pageNavi += "<a class='btn' href='/searchKey?type="+type+"&keyword="+keyword+"&reqPage="+(pageNo-1)+"'>이전</a>";
		}
		int i=1;
		while(!(i++>pageNaviSize || pageNo>totalPage)) {
			if(reqPage == pageNo) {
				pageNavi += "<span class='selectPage'>"+pageNo+"</span>";
			}else {
				pageNavi += "<a class ='btn' href='/searchKey?type="+type+"&keyword="+keyword+"&reqPage="+pageNo+"'>"+pageNo+"</a>";
			}
			pageNo++;
		}
		if(pageNo <= totalPage) {
			pageNavi += "<a class = 'btn' href='/searchKey?type="+type+"&keyword="+keyword+"&reqPage="+pageNo+"'>다음</a>";
		}
		MemberPageData pd = new MemberPageData(list, pageNavi);
		JDBCTemplate.close(conn);
		return pd;
	}
	public int deleteMember(String memberId) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new MemberDAO().deleteMember(conn, memberId);
		if(result > 0 ) {
			JDBCTemplate.commit(conn);
		}else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}
}
