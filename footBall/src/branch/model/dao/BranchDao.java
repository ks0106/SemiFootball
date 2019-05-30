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
import common.JDBCTemplate;

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

	public Branch selectOne(Connection conn, String branchName) throws SQLException {
		Branch b = null;
		PreparedStatement pstmt = null;
		ResultSet rset = null;
		String query = prop.getProperty("selectOne");
		pstmt = conn.prepareStatement(query);
		pstmt.setString(1, branchName);
		rset = pstmt.executeQuery();
		if(rset.next()) {
			b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(pstmt);
		return b;
	}

}
