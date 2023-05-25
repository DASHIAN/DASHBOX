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
	<% Member member = (Member) request.getAttribute("member"); %> 
	<div class="container" align="center">
		<h3>회원등록성공!!!</h3>
		<table class="table table-dark text-white">
			<tr>
				<td width="20%">아 이 디</td>
				<td><%= member.getId() %></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><%= member.getPassword() %></td>
			</tr>
			<tr>
				<td>이    름</td>
				<td><%= member.getName() %></td>
			</tr>	
			<tr>
				<td>주민번호</td>
				<td><%= member.getRegNumber() %></td>
			</tr>
			<tr>
				<td>성별</td>
				<td><%= member.getGender() %></td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td><%= member.getMileage() %></td>
			</tr>					
		</table>
		<a href="/jsp08_member/login_form.jsp" class="btn btn-primary mt-sm-5 mr-sm-2">로그인</a>
		<a href="/jsp08_member" class="btn btn-primary mt-sm-5">홈페이지</a>
	</div>
</body>
</html>