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
}
