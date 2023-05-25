<%@page import="com.lec.member.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="container" align="center">
		<h3>로그인성공!!!</h3>
		<% Member member = (Member) session.getAttribute("login_info"); %>
		<h4><%= member.getName() %> 님이 로그인하셨습니다! 환영합니다!!</h4>
		<a href="logout" class="btn btn-primary mt-sm-5  mr-sm-2">Log Out</a>
		<a href="list" class="btn btn-primary mt-sm-5 mr-sm-2">회원목록</a>
<%-- 		<a href="/jsp08_member/member_detail.jsp?id=<%= member.getId() %>" class="btn btn-primary mt-sm-5 ">회원정보</a> --%>	
		<a href="remove" class="btn btn-primary mt-sm-5 mr-sm-2">회원탈퇴</a>
   		
    </div>
</body>
</html>