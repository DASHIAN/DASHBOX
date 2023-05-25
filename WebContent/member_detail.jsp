<%@page import="com.lec.member.dto.Member"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	<% Member member = (Member) request.getAttribute("member"); %>
	<div class="container" align = "center">
		<h3>회원상세정보</h3>
		<table class="table table-dark text-light">
			<tr>
				<td width="20%">아 이 디</td>
				<td><%= member.getId() %></td>
			</tr>
			<tr>
				<td>이   름</td>
				<td><%= member.getName() %></td>
			</tr>
			<tr>
				<td>주민번호</td>
				<td><%= member.getRegNumber() %></td>
			</tr>
			<tr>
				<td>성   별</td>
				<td><%= member.getGender() %></td>
			</tr>
			<tr>
				<td>마일리지</td>
				<td><%= member.getMileage() %></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="button" class="btn btn-success mr-md-3" value="회원수정" 
					onclick="location.href='detail?id=<%=member.getId()%>&type=u'"/>
					<input type="button" class="btn btn-success mr-md-3" value="회원탈퇴" 
					onclick="location.href='delete?id=<%=member.getId()%>'" />
					<input type="button" class="btn btn-success mr-md-3" value="회원목록"  
					onclick="location.href='list'"/>
				</td>
			</tr>
		</table>
	</div>
</body>
</html>






