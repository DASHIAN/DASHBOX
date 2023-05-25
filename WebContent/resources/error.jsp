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
	<% String message = (String) request.getAttribute("error_message"); %>
	<div class="container" align="center">
		<h3>로그인 or 회원등록 실패!!!</h3>
		<h4><p class="bg-danger text-white">에러 : <%= message %></p></h4>
		<a href="/jsp08_member" class="btn btn-info">홈페이지로 이동하기</a>
	</div>
</body>
</html>