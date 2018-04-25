package com.kosmo.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.kosmo.db.DBConnect;
import com.kosmo.member.MemberVO;

public class BoardCrud {

	public ArrayList<WrapperVO> boardList(int sseq, int eseq, String btype) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<WrapperVO> boardList = new ArrayList<WrapperVO>();
		
		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//					+ "from (select rownum as rnum, t.* "
//					+ "from (select * from board b order by bseq desc) t) "
//					+ "where rnum between ? and ?";
			
//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//				       + "from (select rownum as rnum, t.* "
//				          + "from (select * from board b "
//				          + "where btype=? "
//				          + "order by bseq desc) t) "
//				       + "where rnum between ? and ?";
			
			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, mname, bfile_path, bfile_name, bfile_size, regdate "
						+ "from (select rownum as rnum, t.* "
								+ "from (select b.bseq, b.btype, b.btitle, b.bcon, b.mseq, m.mname, b.bfile_path, b.bfile_name, b.bfile_size, to_char(b.regdate, 'mm/dd') as regdate "
										+ "from board b, member m where b.mseq = m.mseq(+) ";
					

			if(!(btype == null || btype.equals(""))) {
				sql += "and btype=? "
						+ "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btype);
				pstmt.setInt(2, sseq);
				pstmt.setInt(3, eseq);
			} else {
				sql += "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sseq);
				pstmt.setInt(2, eseq);
			}
			
//			if(!(btype == null || btype.equals(""))) {
//				sql += " and btype = ?";		
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//				pstmt.setString(3, btype);
//			} else {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				WrapperVO wvo = new WrapperVO();
				BoardVO bvo = new BoardVO();
				MemberVO mvo = new MemberVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtype(rs.getString("btype"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBcon(rs.getString("bcon"));
				bvo.setMseq(rs.getInt("mseq"));
				mvo.setMname(rs.getString("mname"));
				bvo.setBfilePath(rs.getString("bfile_Path"));
				bvo.setBfileName(rs.getString("bfile_Name"));
				bvo.setBfileSize(rs.getInt("bfile_Size"));
				bvo.setRegdate(rs.getString("regdate"));

				
				System.out.println(bvo.getBseq());
				
				wvo.setBvo(bvo);
				wvo.setMvo(mvo);
				boardList.add(wvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return boardList;
	}
	
	public ArrayList<WrapperVO> boardList(int sseq, int eseq, String btype, String searchGubun, String searchStr) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<WrapperVO> boardList = new ArrayList<WrapperVO>();
		
		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//					+ "from (select rownum as rnum, t.* "
//					+ "from (select * from board b order by bseq desc) t) "
//					+ "where rnum between ? and ?";
			
//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//				       + "from (select rownum as rnum, t.* "
//				          + "from (select * from board b "
//				          + "where btype=? "
//				          + "order by bseq desc) t) "
//				       + "where rnum between ? and ?";
			
			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, mname, bfile_path, bfile_name, bfile_size, regdate "
						+ "from (select rownum as rnum, t.* "
								+ "from (select b.bseq, b.btype, b.btitle, b.bcon, b.mseq, m.mname, b.bfile_path, b.bfile_name, b.bfile_size, to_char(b.regdate, 'mm/dd') as regdate "
										+ "from board b, member m where b.mseq = m.mseq(+) and "+ searchGubun +" like ? ";
					

			if(!(btype == null || btype.equals(""))) {
				sql += "and btype=? "
						+ "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + searchStr + "%");
				pstmt.setString(2, btype);
				pstmt.setInt(3, sseq);
				pstmt.setInt(4, eseq);
			} else {
				sql += "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, "%" + searchStr + "%");
				pstmt.setInt(2, sseq);
				pstmt.setInt(3, eseq);
			}
			
//			if(!(btype == null || btype.equals(""))) {
//				sql += " and btype = ?";		
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//				pstmt.setString(3, btype);
//			} else {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				WrapperVO wvo = new WrapperVO();
				BoardVO bvo = new BoardVO();
				MemberVO mvo = new MemberVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtype(rs.getString("btype"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBcon(rs.getString("bcon"));
				bvo.setMseq(rs.getInt("mseq"));
				mvo.setMname(rs.getString("mname"));
				bvo.setBfilePath(rs.getString("bfile_Path"));
				bvo.setBfileName(rs.getString("bfile_Name"));
				bvo.setBfileSize(rs.getInt("bfile_Size"));
				bvo.setRegdate(rs.getString("regdate"));

				wvo.setBvo(bvo);
				wvo.setMvo(mvo);
				boardList.add(wvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return boardList;
	}
	
	/*
	public ArrayList<BoardVO> boardList(int sseq, int eseq, String btype) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//					+ "from (select rownum as rnum, t.* "
//					+ "from (select * from board b order by bseq desc) t) "
//					+ "where rnum between ? and ?";
			
//			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'mm/dd') as regdate "
//				       + "from (select rownum as rnum, t.* "
//				          + "from (select * from board b "
//				          + "where btype=? "
//				          + "order by bseq desc) t) "
//				       + "where rnum between ? and ?";
			
			String sql = "select rnum, bseq, btype, btitle, bcon, mseq, mname, bfile_path, bfile_name, bfile_size, regdate "
						+ "from (select rownum as rnum, t.* "
								+ "from (select b.bseq, b.btype, b.btitle, b.bcon, b.mseq, m.mname, b.bfile_path, b.bfile_name, b.bfile_size, to_char(b.regdate, 'mm/dd') as regdate "
										+ "from board b, member m where b.mseq = m.mseq ";
					

			if(!(btype == null || btype.equals(""))) {
				sql += "where btype=? "
						+ "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btype);
				pstmt.setInt(2, sseq);
				pstmt.setInt(3, eseq);
			} else {
				sql += "order by bseq desc) t) "
						+ "where rnum between ? and ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, sseq);
				pstmt.setInt(2, eseq);
			}
			
//			if(!(btype == null || btype.equals(""))) {
//				sql += " and btype = ?";		
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//				pstmt.setString(3, btype);
//			} else {
//				pstmt = conn.prepareStatement(sql);
//				pstmt.setInt(1, sseq);
//				pstmt.setInt(2, eseq);
//			}
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				MemberVO mvo = new MemberVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtype(rs.getString("btype"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBcon(rs.getString("bcon"));
				bvo.setMseq(rs.getInt("mseq"));
				mvo.setMname(rs.getString("mname"));
				bvo.setBfilePath(rs.getString("bfile_Path"));
				bvo.setBfileName(rs.getString("bfile_Name"));
				bvo.setBfileSize(rs.getInt("bfile_Size"));
				bvo.setRegdate(rs.getString("regdate"));

				
				boardList.add(bvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return boardList;
	}
	*/
	
	public int boardCount(String btype) {
		int cnt = 0;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------
			
			String sql = "select count(*) as cnt from board";
			
			if(!(btype == null || btype.equals(""))) {
				sql += "where btype=?"; 
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, btype);
			} else {
				pstmt = conn.prepareStatement(sql);
			}
			
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
	
	
//	public int boardCount() {
//		int cnt = 0;
//		Connection conn = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		DBConnect db = new DBConnect();
//
//		try {
//			// ------------------------------------
//			conn = db.dbConn();
//			// ------------------------------------
//
//			String sql = "select count(*) as cnt from board"
//						+ "where type=?";
//			
//			pstmt = conn.prepareStatement(sql);
//			
//			rs = pstmt.executeQuery();
//
//			if (rs.next()) {
//				cnt = rs.getInt("cnt");
//			}
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally { // 꼭 해줘
//			// ------------------------------------
//			db.dbClose(rs, pstmt, conn);
//			// ------------------------------------
//		}
//		return cnt;
//	}
	
	/*public ArrayList<BoardVO> boardTypeList(String typeStr) {

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();

		ArrayList<BoardVO> boardList = new ArrayList<BoardVO>();

		try {
			// ------------------------------------
			conn = db.dbConn();
			// ------------------------------------

			String sql = "select * from board where btype=? order by bseq desc";
			pstmt = conn.prepareStatement(sql);

			pstmt.setString(1, typeStr);
			
			rs = pstmt.executeQuery();

			while (rs.next()) {
				BoardVO bvo = new BoardVO();
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtype(rs.getString("btype"));
				bvo.setBcon(rs.getString("bcon"));
				bvo.setMseq(rs.getInt("mseq"));
				bvo.setBfilePath(rs.getString("bfilePath"));
				bvo.setBfileName(rs.getString("bfileName"));
				bvo.setBfileSize(rs.getInt("bfileSize"));
				bvo.setRegdate(rs.getString("regdate"));

				boardList.add(bvo);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		} finally { // 꼭 해줘
			// ------------------------------------
			db.dbClose(rs, pstmt, conn);
			// ------------------------------------
		}

		return boardList;
	}*/
	
	public int boardInsert(BoardVO bvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "insert into board values(board_seq.nextval, ?, ?, ?, ?, ?, ?, ?, sysdate)";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bvo.getBtype());
			pstmt.setString(2, bvo.getBtitle());
			pstmt.setString(3, bvo.getBcon());
			pstmt.setInt(4,  bvo.getMseq());
			pstmt.setString(5, bvo.getBfilePath());
			pstmt.setString(6, bvo.getBfileName());
			pstmt.setLong(7, bvo.getBfileSize());
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return rows;
	}
	
	public int boardUpdate(BoardVO bvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		
		try {
			conn = db.dbConn();
			
			String sql = "update board "
					+ "set btype=?, btitle=?, bcon=?, bfile_path=?, bfile_name=?, bfile_size=?, regdate=sysdate "
					+ "where bseq=?"; 

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bvo.getBtype());
			pstmt.setString(2, bvo.getBtitle());
			pstmt.setString(3, bvo.getBcon());
			pstmt.setString(4, bvo.getBfilePath());
			pstmt.setString(5, bvo.getBfileName());
			pstmt.setLong(6, bvo.getBfileSize());
			pstmt.setInt(7, bvo.getBseq());
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return rows;
	}
	
public int boardNonFileUpdate(BoardVO bvo) {
		
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		
		try {
			conn = db.dbConn();
			
			String sql = "update board "
					+ "set btype=?, btitle=?, bcon=?, regdate=sysdate "
					+ "where bseq=?"; 

			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, bvo.getBtype());
			pstmt.setString(2, bvo.getBtitle());
			pstmt.setString(3, bvo.getBcon());
			pstmt.setInt(4, bvo.getBseq());
			
			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		
		return rows;
	}
	
	public int boardDelete(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		int rows = 0;
		
		DBConnect db = new DBConnect();
		
		try {
			conn = db.dbConn();
			
			String sql = "delete from board where bseq=?";
			
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, bseq);

			rows = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return rows;
	}
	
	
	public BoardVO bodySelect(int bseq) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		DBConnect db = new DBConnect();
		
		BoardVO bvo = new BoardVO();
		
		try {
			conn = db.dbConn();
			
			String sql = "select bseq, btype, btitle, bcon, mseq, bfile_path, bfile_name, bfile_size, to_char(regdate, 'yyyy-mm-dd hh24:mi:ss') as regdate from board where bseq=?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setInt(1, bseq);
			
			rs = pstmt.executeQuery();

			if (rs.next()) {
				
				bvo.setBseq(rs.getInt("bseq"));
				bvo.setBtype(rs.getString("btype"));
				bvo.setBtitle(rs.getString("btitle"));
				bvo.setBcon(rs.getString("bcon"));
				bvo.setMseq(rs.getInt("mseq"));
				bvo.setBfilePath(rs.getString("bfile_Path"));
				bvo.setBfileName(rs.getString("bfile_Name"));
				bvo.setBfileSize(rs.getInt("bfile_Size"));
				bvo.setRegdate(rs.getString("regdate"));
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			db.dbClose(pstmt, conn);
		}
		return bvo;
	}
	
	
	
}
