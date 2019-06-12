package member.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
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
			m.setPwdHint(rset.getString("pwd_hint"));
			m.setPwdHintAnswer(rset.getString("pwd_hint_answer"));
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
		pstmt.setString(5, m.getPwdHint());
		pstmt.setString(6, m.getPwdHintAnswer());
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
	public int kakaoInsert(Connection conn, String id , String name) {
		PreparedStatement pstmt = null;
		int result =0;
		String query = prop.getProperty("kakaoInsert");
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, id);
			pstmt.setString(2, name);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
		
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
	public String searchPwd(Connection conn, String id , String name)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String id1 = null;
		String query = prop.getProperty("searchPwd");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, id);
		pstmt.setString(2, name);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			id1=rset.getString("id");
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return id1;
	}
	public int researchPwd(Connection conn, String id, String rePwd)throws SQLException{
		PreparedStatement pstmt =null;
		int result = 0;
		String query = prop.getProperty("researchPwd");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, rePwd);
		pstmt.setString(2, id);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public Member printAll(Connection conn, String id)throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset=null;
		Member m = null;
		String query = prop.getProperty("printAll");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, id);
		rset = pstmt.executeQuery();
		m = new Member();
		if(rset.next()) {
			m.setId(rset.getString("id"));
			m.setPwd(rset.getString("pwd"));
			m.setName(rset.getString("name"));
			m.setPhone(rset.getString("phone"));
			m.setPwdHint(rset.getString("pwd_hint"));
			m.setPwdHintAnswer(rset.getString("pwd_hint_answer"));
			m.setEnrollDate(rset.getDate("enroll_date"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return m;
	}
	public int updateMember(Connection conn,String id,String pwd,String pwdHint,String pwdHintAnswer,String phone) throws SQLException{
		PreparedStatement pstmt = null;
		int result = 0;
		String query = prop.getProperty("updateMember");
		
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, pwd);
		pstmt.setString(2, pwdHint);
		pstmt.setString(3, pwdHintAnswer);
		pstmt.setString(4, phone);
		pstmt.setString(5, id);
		result = pstmt.executeUpdate();
		JDBCTemplate.close(pstmt);
		return result;
	}
	public int totalCount(Connection conn) {
		Statement stmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("totalCount");
		int result = 0;
		try {
			stmt = conn.createStatement();
			rset = stmt.executeQuery(query);
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(stmt);
		}
		return result;
	}
	public ArrayList<Member> selectList(Connection conn, int start, int end) {
		ArrayList<Member> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectList");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();
				m.setId(rset.getString("id"));
				m.setName(rset.getString("name"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int totalCount2(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("totalCount2");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public int totalCount3(Connection conn, String keyword) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		int result = 0;
		String query = prop.getProperty("totalCount3");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			rset = pstmt.executeQuery();
			if(rset.next()) {
				result = rset.getInt("cnt");
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
	public ArrayList<Member> searchKeywordId(Connection conn, String keyword, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectIdList");
		ArrayList<Member> list = null;
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, keyword);
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();
				m.setId(rset.getString("id"));
				m.setName(rset.getString("name"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public ArrayList<Member> searchKeywordName(Connection conn, String keyword, int start, int end) {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("searchKeywordName");
		ArrayList<Member> list = null;
		
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, "%"+keyword+"%");
			pstmt.setInt(2, start);
			pstmt.setInt(3, end);
			rset = pstmt.executeQuery();
			list = new ArrayList<Member>();
			while(rset.next()) {
				Member m = new Member();
				m.setId(rset.getString("id"));
				m.setName(rset.getString("name"));
				m.setPhone(rset.getString("phone"));
				m.setEnrollDate(rset.getDate("enroll_date"));
				list.add(m);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(rset);
			JDBCTemplate.close(pstmt);
		}
		return list;
	}
	public int deleteMember(Connection conn, String memberId) {
		PreparedStatement pstmt = null;
		int result=0;
		String query = prop.getProperty("deleteMember");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			JDBCTemplate.close(pstmt);
		}
		return result;
	}
}
