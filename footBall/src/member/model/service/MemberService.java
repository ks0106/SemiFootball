package member.model.service;

import java.sql.Connection;
import java.sql.SQLException;

import common.JDBCTemplate;
import member.model.dao.MemberDAO;
import member.model.vo.Member;

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
	public Member kakaosearchId(String id) {
		Connection conn = JDBCTemplate.getConnection();
		Member m = new MemberDAO().kakaosearchId(conn,id);
		JDBCTemplate.close(conn);
		return m;
	}
	public String searchId(String name , String pwdHint, String pwdHintAnswer)throws SQLException {
		Connection conn =JDBCTemplate.getConnection();
		String id = new MemberDAO().searchId(conn,name,pwdHint,pwdHintAnswer);
		JDBCTemplate.close(conn);
		return id ;
	}
}
