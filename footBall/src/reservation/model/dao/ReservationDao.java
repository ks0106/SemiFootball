package reservation.model.dao;

import java.io.FileReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Properties;

import branch.model.vo.Branch;
import common.JDBCTemplate;

public class ReservationDao {
	private Properties prop = new Properties();
	public ReservationDao() {
		String fileName = ReservationDao.class.getResource("/sql/reservation/reservationQuery.properties").getPath();		//절대경로
		try {
			prop.load(new FileReader(fileName));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<Branch> reservationBranch(Connection conn) throws SQLException{
		ArrayList<Branch> list = null;
		Statement stmt = null;
		ResultSet rset = null;
		String query = "select * from fb_branch";
		stmt = conn.createStatement();
		rset = stmt.executeQuery(query);
		list = new ArrayList<Branch>();
		while(rset.next()) {
			Branch b = new Branch();
			b.setBranchCode(rset.getInt("branch_code"));
			b.setBranchName(rset.getString("branch_name"));
			b.setBranchAddr(rset.getString("branch_addr"));
			b.setBranchPhone(rset.getString("branch_phone"));
			b.setBranchTel(rset.getString("branch_tel"));
			list.add(b);
		}
		JDBCTemplate.close(rset);
		JDBCTemplate.close(stmt);
		return list;
	}

}
