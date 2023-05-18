<%@page import="com.lec.web.exception.InvalidPasswordException"%>
<%@page import="com.lec.web.exception.MessageNotFoundException"%>
<%@page import="com.lec.web.service.UpdateMessageService"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));	
	String pw = request.getParameter("pw");
	String msg = request.getParameter("msg");
	boolean invalidPass = false;
	
	try {
		UpdateMessageService updateService = UpdateMessageService.getInstance();
		updateService.updateMessage(id, pw, msg);
	} catch(MessageNotFoundException e) {
		e.getMessage();
		// 메시지가 예외발생할 경우 sendRedirect()
	} catch(InvalidPasswordException e) {
		invalidPass = true;
	}
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h3>메시지수정하기</h3>
		<% if(!invalidPass) { %>
		   	  <h4 class="bg-success text-white">메시지가 성공적으로 수정이 되었습니다!!!</h4>
		<% } else { %>
			  <h4 class="bg-danger text-white">비밀번호가 일치하지 않습니다! 다시 입력하세요!!!</h4>  
		<% } %>
		<br />
		<a href="list.jsp?page=" class="btn btn-primary">목록보기</a>
	</div>
</body>
</html>