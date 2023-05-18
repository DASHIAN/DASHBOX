<%@page import="com.lec.web.model.Message"%>
<%@page import="com.lec.web.jdbc.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.lec.web.dao.MessageDAO"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));

	MessageDAO messageDAO = MessageDAO.getInstance();
	Connection conn = ConnectionProvider.getConnection();
	Message view_data = messageDAO.select(conn, id);
%>
<c:set var="view_data" value="<%=view_data %>"></c:set>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">   
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>

<title>Insert title here</title>
</head>
<body>
	   <div class="container" align="center">
   
      <h3>메시지 수정하기(페이지번호 : )</h3>
      <form action="update_message.jsp" method="post">
         
         <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
               <span class="input-group-text"><i class="fas fa-user"></i></span>
            </div>
            <input type="text" class="form-control" name="guestName" value="${view_data.guestName}" disabled/>
         </div>
         <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
               <span class="input-group-text"><i class="fas fa-lock"></i></span>
            </div>
            <input type="password" class="form-control" name="pw"/>
         </div>
         <div class="input-group mb-2 mr-sm-2">
            <div class="input-group-prepend">
               <span class="input-group-text"><i class="fas fa-comment-dots"></i></span>
            </div>
            <textarea class="form-control"  name="msg" id="" cols="30" rows="10">${view_data.message}</textarea>
         </div>
         <input type="hidden" name="id" value="${param.id}"/>
         <input type="submit" class="btn btn-primary mb-2" value="메시지수정하기" />
         <!-- update_message.jsp?id=1000&pw=12345&cp=1} -->
      </form>
</body>
</html>