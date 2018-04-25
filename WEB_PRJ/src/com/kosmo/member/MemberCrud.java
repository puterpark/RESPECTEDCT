package com.kosmo.member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Vector;

import javax.swing.table.DefaultTableModel;

import com.kosmo.db.DBConnect;

public class MemberCrud implements Member {

	@Override
	public MemberVO login(MemberVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConnect db = new DBConnect();
		
		MemberVO vo1 = new MemberVO();
		
		try {
			conn = db.dbConn();
			
			String sql = "select mseq, mgubun, mname from member where mid=? and mpw=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			
			rs = pstmt.executeQuery();
			
			
			if(rs.next()) {
				vo.setMseq(rs.getInt("mseq"));
				vo.setMgubun(rs.getString("mgubun"));
				vo.setMname(rs.getString("mname"));
			}
			
		
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return vo1;
		
	}
	
	public int searchMseq(String mid, String mpw) {
		
		int mseq = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "select mseq from member where mid=? and mpw=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, mid);
			pstmt.setString(2, mpw);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				mseq = rs.getInt("mseq");
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(rs, pstmt, conn);
		}
		return mseq;
	}

	@Override
	public ArrayList<MemberVO> memberList(int sseq, int eseq) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

			String sql = "select rnum, mseq, mid, mpw, mname, mgubun, regdate from (select rownum as rnum, m.* from member m order by mseq) t where rnum between ? and ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, sseq);
			pstmt.setInt(2, eseq);			
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberVO vo = new MemberVO();

				vo.setMseq(rs.getInt("mseq"));
				vo.setMid(rs.getString("mid"));
				vo.setMpw(rs.getString("mpw"));
				vo.setMname(rs.getString("mname"));
				vo.setMgubun(rs.getString("mgubun"));
				vo.setRegdate(rs.getString("regdate"));
				
				memberList.add(vo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return memberList;
	}

	@Override
	public int memberCount() {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

			String sql = "select count(*) as cnt from member";
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				cnt = rs.getInt("cnt");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}
		
		
		return cnt;
	}

	@Override
	public void memberUpdate(MemberVO vo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DBConnect db = new DBConnect();
		
		
		try {
			conn = db.dbConn();
			
			String sql = "update member set mpw=?, mname=? where mseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMpw());
			pstmt.setString(2, vo.getMname());
			pstmt.setInt(3, vo.getMseq());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
	}

	@Override
	public void memberDelete(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		DBConnect db = new DBConnect();
		
		
		try {
			conn = db.dbConn();
			
			String sql = "delete from member where mseq=?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, mseq);
			
			pstmt.executeQuery();
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
	}

	@Override
	public int memberInsert(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "insert into member values (member_seq.nextval, ?, ?, ?, 'u', sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMname());
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return rows;
	}
	
	
	public int adminRegister(MemberVO vo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "insert into member values (member_seq.nextval, ?, ?, ?, 'a', sysdate)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getMid());
			pstmt.setString(2, vo.getMpw());
			pstmt.setString(3, vo.getMname());
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return rows;
	}
	
	
	public ArrayList<MemberVO> memberDetail(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<MemberVO> memberList = new ArrayList<MemberVO>();
		
		
		try {
			conn = db.dbConn();
			
			String sql = "select * from member where mseq=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mseq);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				MemberVO vo = new MemberVO();

				vo.setMseq(rs.getInt("mseq"));
				vo.setMid(rs.getString("Mid"));
				vo.setMpw(rs.getString("mpw"));
				vo.setMname(rs.getString("mname"));
				vo.setMgubun(rs.getString("mgubun"));
				vo.setRegdate(rs.getString("regdate"));
				
				memberList.add(vo);
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return memberList;
	}
	
	
	public MemberVO memberSelect(int mseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();
		
		MemberVO vo = new MemberVO();
		try {
			conn = db.dbConn();
			
			String sql = "select * from member where mseq=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, mseq);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {

				vo.setMseq(rs.getInt("mseq"));
				vo.setMid(rs.getString("Mid"));
				vo.setMpw(rs.getString("mpw"));
				vo.setMname(rs.getString("mname"));
				vo.setMgubun(rs.getString("mgubun"));
				vo.setRegdate(rs.getString("regdate"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return vo;
	}
	
public ArrayList<String> objectList() {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<String> objectlist = new ArrayList<String>();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

			String sql = "select distinct object_type from user_objects";
			pstmt = conn.prepareStatement(sql);

			rs = pstmt.executeQuery();

			while (rs.next()) {
				objectlist.add(rs.getString("object_type"));
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return objectlist;
	}

public ArrayList<String> selectObjectList(String type) {
	
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	DBConnect db = new DBConnect();

	ArrayList<String> objectlist = new ArrayList<String>();

	try {
		// ------------------------------------
		conn = db.dbConn();
		// ------------------------------------

		String sql = "select object_name from user_objects where object_type=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, type);

		rs = pstmt.executeQuery();

		while (rs.next()) {
			objectlist.add(rs.getString("object_name"));
		}

	} catch (SQLException e) {
		e.printStackTrace();
	} finally { // 꼭 해줘
		// ------------------------------------
		db.dbClose(rs, pstmt, conn);
		// ------------------------------------
	}

	return objectlist;
}


public DefaultTableModel resultSetToTableModel(String sql){
	Vector<Vector<Object>> rows = null;
	Vector<String> colNameList =null;
	try {
		DBConnect db = new DBConnect();
		Connection conn = db.dbConn();
		Statement stmt= conn.createStatement();
		ResultSet rs = stmt.executeQuery(sql);

		ResultSetMetaData metaData = rs.getMetaData();
		int colCount = metaData.getColumnCount();

		colNameList = new Vector<String>();
		for (int column = 0; column < colCount; column++) {
			colNameList.add(metaData.getColumnLabel(column + 1));
		}
		rows = new Vector<Vector<Object>>();
		while (rs.next()) {
			Vector<Object> newRow = new Vector<Object>();
			for (int i = 1; i <= colCount; i++) {
				newRow.addElement(rs.getObject(i));
			}
			rows.addElement(newRow);
		}

	}
	catch (Exception e) {
//		e.printStackTrace();
		String errMsg = e.getMessage();
		Vector<Object> errRow = new Vector<Object>();
		errRow.addElement(errMsg);
		rows.addElement(errRow);
		return new DefaultTableModel(rows, null);
	}
	return new DefaultTableModel(rows, colNameList);
}
	
//public ArrayList<MemberVO> recentMemberList() {
//		
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		DBConnect db = new DBConnect();
//
//		ArrayList<MemberVO> recentMemberList = new ArrayList<MemberVO>();
//
//		try {
//			// ------------------------------------
//			conn = db.dbConn();
//			// ------------------------------------
//
//			String sql = "select * from member where seq = (select max(seq) from member)";
//			pstmt = conn.prepareStatement(sql);
//
//			rs = pstmt.executeQuery();
//
//			while (rs.next()) {
//				MemberVO vo = new MemberVO();
//
//				vo.setMseq(rs.getInt("mseq"));
//				vo.setMid(rs.getString("Mid"));
//				vo.setMpw(rs.getString("mpw"));
//				vo.setMname(rs.getString("mname"));
//				vo.setMgubun(rs.getString("mgubun"));
//				vo.setRegdate(rs.getString("regdate"));
//				
//				recentMemberList.add(vo);
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally { // 꼭 해줘
//			// ------------------------------------
//			db.dbClose(rs, pstmt, conn);
//			// ------------------------------------
//		}
//
//		return recentMemberList;
//	}
//
}
