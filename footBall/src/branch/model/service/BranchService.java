package branch.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.dao.BranchDao;
import branch.model.vo.BranchData;
import common.JDBCTemplate;

public class BranchService {

	public ArrayList<BranchData> callList() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BranchData> list = new BranchDao().callList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public BranchData selectOne(String branchName) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		BranchData bd = new BranchDao().selectOne(conn, branchName);
		JDBCTemplate.close(conn);
		return bd;
	}

}
