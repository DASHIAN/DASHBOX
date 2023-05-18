package com.lec.web.service;

import java.sql.Connection;
import java.sql.SQLException;

import com.lec.web.dao.MessageDAO;
import com.lec.web.exception.InvalidPasswordException;
import com.lec.web.exception.MessageNotFoundException;
import com.lec.web.exception.ServiceException;
import com.lec.web.jdbc.ConnectionProvider;
import com.lec.web.jdbc.JDBCUtil;
import com.lec.web.model.Message;

public class DeleteMessageService {

	// singleton
	private DeleteMessageService() {}
	private static DeleteMessageService instance = new DeleteMessageService();
	public static DeleteMessageService getInstance() { return instance; }
	
	public void deleteMessag(int id, String pw) throws Exception {
		Connection conn = null;
		
		try {
			conn = ConnectionProvider.getConnection();
			conn.setAutoCommit(false);
			MessageDAO messageDAO = MessageDAO.getInstance();
			Message message = messageDAO.select(conn, id);
			
			if(message == null) throw new MessageNotFoundException(id + "번 메시지를 찾지 못했습니다!!");
			if(!message.matchPassword(pw)) throw new InvalidPasswordException("비밀번호가 틀립니다! 다시입력하세요!!");
			
			messageDAO.delete(conn, id);
			conn.commit();
			
		} catch (SQLException e) {
			throw new ServiceException("메시지삭제실패!!! " + e.getMessage(), null);
		} catch(MessageNotFoundException | InvalidPasswordException e) {
			JDBCUtil.rollback(conn);
			throw e;
		} finally {
			JDBCUtil.close(conn, null, null);
		}
	}
}



