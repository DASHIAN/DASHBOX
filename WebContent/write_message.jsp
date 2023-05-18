<%@page import="com.lec.web.service.WriteMessageService"%>
<%@page import="com.lec.web.model.Message"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	request.setCharacterEncoding("utf-8");
	Message message = new Message();
	message.setGuestName(request.getParameter("guestName"));
	message.setPassword(request.getParameter("password"));
	message.setMessage(request.getParameter("message"));
%>
<%-- 

<jsp:useBean id="message" class="com.lec.web.model.Message" >
	<jsp:setProperty name="message" property="*"/>
</jsp:useBean> --%>
<% 
	WriteMessageService writeService = WriteMessageService.getInstance();
	writeService.write(message);
	//redirect하는 방법(1)
	// response.sendRedirect("list.jsp");
%>
<!-- redirect하는 방법(1) -->
<%-- <jsp:forward page="list.jsp"/> --%>
<script>
	//redirect하는 방법(3)
	//window.location = "list.jsp";
</script>

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
		<h3>방명록등록하기</h3>
		<p class="bg-success text-white">방명록에 메시지가 성공적으로 등록이 되었습니다!</p>
		<a class="btn btn-primary" href="list.jsp">방명록목록보기</a>
	</div>
</body>
</html>