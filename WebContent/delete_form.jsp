<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	int id = Integer.parseInt(request.getParameter("id"));
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
	<title>Insert title here</title>
</head>
<body>
	<div class="container" align="center">
		<h3>메시지삭제하기</h3>
		
		<form action="delete_message.jsp" method="post">
			<b class="text-danger">메시지를 삭제하려면 비밀번호를 입력하세요!!</b>
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-lock"></i></span>
				</div>
				<input type="password" name="pw" class="form-control" size="30">
			</div>
			<input type="hidden" name="id" value="${param.id}"/>			
			<input type="submit" class="btn btn-danger" value="메시지삭제"/>
		</form>
	</div>
</body>
</html>