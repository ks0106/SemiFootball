package branch.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.dao.BranchDao;
import branch.model.vo.Branch;
import branch.model.vo.BranchData;
import common.JDBCTemplate;

public class BranchService {

	public ArrayList<BranchData> callList() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BranchData> list = new BranchDao().callList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public Branch selectOne(String branchName) throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		Branch b = new BranchDao().selectOne(conn, branchName);
		JDBCTemplate.close(conn);
		return b;
	}

}
