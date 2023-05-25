<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">	
  	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
 	<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.0/css/all.css" 
		integrity="sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ"
		crossorigin="anonymous">  
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
  	<style>
  		.login-btn {
  			clear: black;
  			/* background-color: #FFC312; */
  			width: 100px;
  		}
  		.login-btn:hover {
  			clear: white;
  			background-color: black;  		
  		}
  		.input-group-prepend span {
  			color: black;
  			border-left-color: #FFC312;
  			width: 40px;
  			border: 0 !important;
  		}
  	</style>
</head>
<body>
	<div class="container" align="center">
	
		<h3 class="mt-md-5 mb-md-5">로그인</h3>
		
		<%
			String message = (String) request.getAttribute("error_message");
			if(message != null) {
		%>
				<h4><p class="bg-danger text-white">에러 :<%= message %></p></h4>
		<% 
		    } 
		%>
		
		<form action="login" method="post">
			<div class="input-group form-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-user"></i></span></div>
				<input type="text" name="id" class="form-control" placeholder="user id ..." value="hong">
			</div>
			<div class="input-group form-group">
				<div class="input-group-prepend"><span class="input-group-text"><i class="fas fa-key"></i></span></div>
				<input type="password" name="pw" class="form-control" placeholder="pasword ..." value="12345">
			</div>
			<div class="row align-items-center remember">
				<input type="checkbox" class="ml-lg-3 mr-sm-3"> Remember Me
			</div>
			
			<div class="form-group">
				<input type="submit" class="btn btn-primary float-right login-btn ml-sm-2" value="Login">
				<input type="reset" class="btn btn-primary float-right login-btn ml-sm-2" value="Reset">
			</div>
		</form>
	</div>
</body>
</html>