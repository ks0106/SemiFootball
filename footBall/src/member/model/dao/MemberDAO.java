package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;

import javax.naming.spi.DirStateFactory.Result;

import common.JDBCTemplate;
import member.model.vo.Member;

public class MemberDAO {
	private Properties prop = new Properties();
	public MemberDAO(){
		String fileName = MemberDAO.class.getResource("/sql/member/memberQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public Member login(Connection conn, String id, String pwd)throws SQLException {
		PreparedStatement pstmt = null;
		Member m = null;
		ResultSet rset = null;
		String query = prop.getProperty("login");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, pwd);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			m= new Member();
			m.setId(rset.getString("id"));
			m.setPwd(rset.getString("pwd"));
			m.setName(rset.getString("name"));
			m.setPhone(rset.getString("phone"));
			m.setEnrollDate(rset.getDate("enroll_Date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return m;
	}
	public int insert(Connection conn, Member m)throws SQLException{
		PreparedStatement pstmt =null;
		int result =0;
		String query = prop.getProperty("insert");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, m.getId());
		pstmt.setString(2, m.getPwd());
		pstmt.setString(3, m.getName());
		pstmt.setString(4, m.getPhone());
		pstmt.setString(5, m.getPwdHintAnswer());
		pstmt.setString(6, m.getPwdHint());
		result = pstmt.executeUpdate();
		return result;
	}
	public Member kakaosearchId(Connection conn , String id) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		Member m =null;
		String query = "select * from member where id=?";
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			rset=pstmt.executeQuery();
			if(rset.next()) {
				m= new Member();
				m.setId(rset.getString("id"));
				m.setPwd(rset.getString("pwd"));
				m.setName(rset.getString("name"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enroll_Date"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return m;
	}
	public String searchId(Connection conn,String name , String pwdHint,String pwdHintAnswer)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id =null;
		String query = prop.getProperty("searchId");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, name);
		pstmt.setString(2, pwdHint);
		pstmt.setString(3, pwdHintAnswer);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			id=rset.getString("id");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return id;
	}
}
