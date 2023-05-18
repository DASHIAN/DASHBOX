package com.lec.web.service;

import java.sql.Connection;
import java.util.Collections;
import java.util.List;

import com.lec.web.dao.MessageDAO;
import com.lec.web.exception.ServiceException;
import com.lec.web.jdbc.ConnectionProvider;
import com.lec.web.jdbc.JDBCUtil;
import com.lec.web.model.Message;

public class GetMessageListService {
	//singleton
	private GetMessageListService() {}
	private static GetMessageListService instance = new GetMessageListService();
	public static GetMessageListService getInstance() {return instance;}
	public static final int MESSAGE_COUNT_PER_PAGE = 10;
	
	public MessageListView getMessageList(int pageNumber) {
		Connection conn = null;
		int currentPage = pageNumber;
		try {
			// 커넥션풀에서 사용가능한 Connection을 커넥션제공자를 통해서 가져오기
			conn = ConnectionProvider.getConnection();
			MessageDAO messageDAO = MessageDAO.getInstance();
			
			int totalCount =  messageDAO.selectCount(conn);
			
			List<Message> messageList = null;
			int start = 0;
			int end = 0;
			
			if(totalCount > 0) {
				start = (pageNumber - 1)*MESSAGE_COUNT_PER_PAGE;
				end = MESSAGE_COUNT_PER_PAGE;
				messageList = messageDAO.selectList(conn, start, end);
			}else {
				currentPage = 0;
				messageList = Collections.emptyList();
			}
			
			
			
			return new MessageListView(messageList, totalCount, currentPage,
					MESSAGE_COUNT_PER_PAGE,start,end);
		} catch (Exception e) {
			throw new ServiceException("메세지목록 가져오기 실패: "+e.getMessage(),e);
		}finally {
			JDBCUtil.close(conn, null, null);
		}
		
	}
	
}
