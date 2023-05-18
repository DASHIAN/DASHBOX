package com.lec.web.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.lec.web.jdbc.JDBCUtil;
import com.lec.web.model.Message;

public class MessageDAO {
	
	// singleton
	private MessageDAO() {}
	private static MessageDAO messageDAO = new MessageDAO();
	public static MessageDAO getInstance() { return messageDAO; }

	public List<Message> selectList(Connection conn, int start, int end) {

		List<Message> messageList = new ArrayList<>();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guestbook_message "
				   + " order by message_id desc limit ?, ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			rs = pstmt.executeQuery();			
			
			if(rs.next()) {	
				do {
					messageList.add(makeMessage(rs));
				} while(rs.next());			
			} else {
				return Collections.emptyList();
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return messageList;
	}

	public Message makeMessage(ResultSet rs) throws SQLException {
		Message message = new Message();
		message.setId(rs.getInt("message_id"));
		message.setGuestName(rs.getString("guest_name"));
		message.setPassword(rs.getString("password"));
		message.setMessage(rs.getString("message"));
		return message;
	}

	public int insert(Connection conn, Message message) {
		
		PreparedStatement pstmt = null;
		String sql = "insert into guestbook_message(guest_name, password, message) " 
				   + " values(?,?,?)";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, message.getGuestName());
			pstmt.setString(2, message.getPassword());
			pstmt.setString(3, message.getMessage());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			JDBCUtil.close(conn, pstmt, null);
		}
		return 0;
	}

	public Message select(Connection conn, int id) throws SQLException {
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from guestbook_message where message_id = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) return makeMessage(rs);
			else return null;		
		} finally {
			JDBCUtil.close(null, pstmt, null);
		}		
	}

	public int delete(Connection conn, int id) throws SQLException {
		
		PreparedStatement pstmt = null;
		String sql = "delete from guestbook_message where message_id = ?";

		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			return pstmt.executeUpdate();	
		} finally {
			JDBCUtil.close(null, pstmt, null);
		}
	}

	public int update(Connection conn, int id, String msg) throws Exception {
		PreparedStatement pstmt = null;
		String sql = "update guestbook_message set message=?"
				   + " where message_id=?" ;
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, id);
			pstmt.setInt(2, id);
			return pstmt.executeUpdate();	
		} finally {
			JDBCUtil.close(null, pstmt, null);
		}
	}
	// 1. 전체레코드 수 구하기 = 1001
	public int selectCount(Connection conn) throws Exception{
		Statement stmt = null;
		ResultSet rs = null;
		String sql = "select count(*) from guestbook_message";
		
		try {
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			rs.next();
			return rs.getInt(1); // 총 방명록 건수
		}finally {
			JDBCUtil.close(null, stmt, rs);
		}
				
	}
	
}













