package branch.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import branch.model.dao.BranchDao;
import branch.model.vo.Branch;
import common.JDBCTemplate;

public class BranchService {

	public ArrayList<Branch> callList() throws SQLException {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Branch> list = new BranchDao().callList(conn);
		JDBCTemplate.close(conn);
		return list;
	}

}
