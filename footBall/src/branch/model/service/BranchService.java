package branch.model.service;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import org.apache.catalina.valves.JDBCAccessLogValve;

import branch.model.dao.BranchDao;
import branch.model.vo.Branch;
import branch.model.vo.BranchData;
import branch.model.vo.BranchImgs;
import branch.model.vo.CourtData;
import common.JDBCTemplate;
import court.model.vo.Court;

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
	
	public BranchData selectOne(int branchCode) {
		Connection conn = JDBCTemplate.getConnection();
		BranchData bd = new BranchDao().selectOne(conn, branchCode);
		return bd;
	}
	
	public int selectBCode(String branchName) {
		Connection conn = JDBCTemplate.getConnection();
		int branchCode = new BranchDao().selectBCode(conn, branchName);
		JDBCTemplate.close(conn);
		return branchCode;
	}

	public ArrayList<Court> selectCourt(int branchCode) {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<Court> list = new BranchDao().selectCourt(conn, branchCode);
		JDBCTemplate.close(conn);
		return list;
	}

	public ArrayList<BranchData> selectAll() {
		Connection conn = JDBCTemplate.getConnection();
		ArrayList<BranchData> list = new BranchDao().selectAll(conn);
		JDBCTemplate.close(conn);
		return list;
	}

	public int insertBranch(Branch b) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BranchDao().insertBranch(conn, b);
		if(result >0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertBi(BranchImgs bi) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BranchDao().insertBi(conn,bi);
		if(result >0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int insertCourt(Court c) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BranchDao().insertCourt(conn, c);
		if(result >0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}

	public int deleteBranch(int branchCode) {
		Connection conn = JDBCTemplate.getConnection();
		int result = new BranchDao().deleteBranch(conn, branchCode);
		if(result >0) {
			JDBCTemplate.commit(conn);
		} else {
			JDBCTemplate.rollback(conn);
		}
		JDBCTemplate.close(conn);
		return result;
	}



	

}
