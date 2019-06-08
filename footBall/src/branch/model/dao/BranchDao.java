package branch.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Properties;

import branch.model.vo.Branch;
import branch.model.vo.BranchData;
import branch.model.vo.BranchImgs;
import branch.model.vo.CourtData;
import common.JDBCTemplate;
import court.model.vo.Court;

public class BranchDao {
	private Properties prop = new Properties();
	public BranchDao() {
		String fileName = BranchDao.class.getResource("/sql/branch/branchQuery.properties").getPath();
		try {
			prop.load(new FileReader(fileName));
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public ArrayList<BranchData> callList(Connection conn) throws SQLException {
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("callList");
		pstmt = conn.prepareStatement(query);
		rset = pstmt.executeQuery();
		ArrayList<BranchData> list = new ArrayList<BranchData>();
		while(rset.next()) {
			Branch b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
			BranchImgs bi = new BranchImgs();
			bi.setBiBCode(rset.getInt("bi_b_code"));
			bi.setBi1(rset.getString("bi1"));
			bi.setBi2(rset.getString("bi2"));
			bi.setBi3(rset.getString("bi3"));
			bi.setBi4(rset.getString("bi4"));
			BranchData bd = new BranchData();
			bd.setB(b);
			bd.setBi(bi);
			list.add(bd);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return list;
	}

	public BranchData selectOne(Connection conn, String branchName) throws SQLException {
		BranchData bd = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, branchName);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			Branch b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
			BranchImgs bi = new BranchImgs();
			bi.setBiBCode(rset.getInt("bi_b_code"));
			bi.setBi1(rset.getString("bi1"));
			bd = new BranchData();
			bd.setB(b);
			bd.setBi(bi);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return bd;
	}

	public ArrayList<Court> selectCourt(Connection conn, int branchCode) {
		ArrayList<Court> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectCourt");
		try {
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, branchCode);
			rset = pstmt.executeQuery();
			list = new ArrayList<Court>();
			while(rset.next()) {
				Court c = new Court();
				c.setCourtType(rset.getString("court_type"));
				c.setCourtIndoor(rset.getString("court_indoor"));
				list.add(c);
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

	public ArrayList<BranchData> selectAll(Connection conn) {
		ArrayList<BranchData> list = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = 
				"with temp as" + 
				"    (select" + 
				"        court_b_code," + 
				"        min(decode(court_type,'A',court_name)) c1," + 
				"        min(decode(court_type,'A','A')) t1," + 
				"        min(decode(court_type,'A',court_indoor)) i1," + 
				"        min(decode(court_type,'B',court_name)) c2," + 
				"        min(decode(court_type,'B','B')) t2," + 
				"        min(decode(court_type,'B',court_indoor)) i2," + 
				"        min(decode(court_type,'C',court_name)) c3," + 
				"        min(decode(court_type,'C','C')) t3," + 
				"        min(decode(court_type,'C',court_indoor)) i3" + 
				"    from fb_court" + 
				"    group by court_b_code)" +  
				"select * " + 
				"from " + 
				"    fb_branch " + 
				"    join" + 
				"    fb_branch_imgs on(branch_code = bi_b_code)" + 
				"    join" + 
				"    temp on(branch_code = court_b_code)" + 
				"order by branch_code";
				
		try {
			pstmt = conn.prepareStatement(query);
			rset = pstmt.executeQuery();
			list = new ArrayList<BranchData>();
			while(rset.next()) {
				Branch b = new Branch();
				b.setBranchCode(rset.getInt("branch_code"));
				b.setBranchName(rset.getString("branch_name"));
				b.setBranchAddr(rset.getString("branch_addr"));
				b.setBranchPhone(rset.getString("branch_phone"));
				b.setBranchTel(rset.getString("branch_tel"));
				BranchImgs bi = new BranchImgs();
				bi.setBi1(rset.getString("bi1"));
				bi.setBi2(rset.getString("bi2"));
				bi.setBi3(rset.getString("bi3"));
				bi.setBi4(rset.getString("bi4"));
				CourtData cd = new CourtData();
				cd.setC1(rset.getString("c1"));
				cd.setC2(rset.getString("c2"));
				cd.setC3(rset.getString("c3"));
				cd.setT1(rset.getString("t1"));
				cd.setT2(rset.getString("t2"));
				cd.setT3(rset.getString("t3"));
				cd.setI1(rset.getString("i1"));
				cd.setI2(rset.getString("i2"));
				cd.setI3(rset.getString("i3"));
				BranchData bd = new BranchData();
				bd.setB(b);
				bd.setBi(bi);
				bd.setC(cd);
				list.add(bd);
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

}
