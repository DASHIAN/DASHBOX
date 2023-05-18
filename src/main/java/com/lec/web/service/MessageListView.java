package com.lec.web.service;

import java.util.List;

import com.lec.web.model.Message;

public class MessageListView {

	private List<Message> messageList; // Java Beans, DTO, VO, Model
	
	// 페이지관련정보
	private int totalCount;     // 전체레코드수
	private int currentPage;    // 현재페이지
	private int perPage;        // 페이지당 표시할 건수
	private int start;          // 조회할 시작 레코드
	private int end;            // 조회할 종료 레코드
	private int pageTotalCount; // 총페이수 = totalCount / perPage(나머지가 있다면 + 1)
	
	// 생성자
	public MessageListView(List<Message> messageList, int totalCount, int currentPage, 
			int perPage, int start, int end) {
		super();
		this.messageList = messageList;
		this.totalCount = totalCount;
		this.currentPage = currentPage;
		this.perPage = perPage;
		this.start = start;
		this.end = end;
		calculateTotalCount();
	}
	
	private void calculateTotalCount() {
		if(totalCount == 0) {
			pageTotalCount = 0;
		} else {
			pageTotalCount = totalCount / perPage;
			if(totalCount % perPage >0) pageTotalCount++;
		}
	}

	// getter
	public List<Message> getMessageList() {
		return messageList;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getPerPage() {
		return perPage;
	}

	public int getStart() {
		return start;
	}

	public int getEnd() {
		return end;
	}

	public int getPageTotalCount() {
		return pageTotalCount;
	}
}
