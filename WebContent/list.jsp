<%@page import="com.lec.web.service.MessageListView"%>
<%@page import="com.lec.web.service.GetMessageListService"%>
<%@page import="java.util.List"%>
<%@page import="com.lec.web.dao.MessageDAO"%>
<%@page import="com.lec.web.model.Message"%>
<%@page import="java.util.ArrayList"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%
	int pageNumber = 1;
	if(request.getParameter("page") != null) {
		pageNumber = Integer.parseInt(request.getParameter("page"));
	}

	GetMessageListService messageListService = GetMessageListService.getInstance();
	MessageListView view_data = messageListService.getMessageList(pageNumber);
	session.setAttribute("pag", pageNumber);
%>
<c:set var="view_data" value="<%= view_data %>"/>

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
  		body, html { height: 100%; margin: 0; }
  		.bg {
  			background-image: url("./resources/img/bg_img_01.png");
  			height: 50%;
  			background-position: center;
  			background-repeat: no-repeat;
  			background-size: cover;
  		}
  	</style>  	
</head>
<body>
	<div class="container" align="center">
	
		<div class="bg jumbotron">
			<h1 class="text-light">방명록</h1>
			<p class="text-light">방문해주셔서 감사합니다! 방명록을 작성해 주시기 바랍니다!!</p>
		</div>
		
		<nav class="navbar navbar-expand-sm bg-success">
			<!-- Brand Logo  -->
			<a href="#" class="navbar-brand">
				<img src="./resources/img/bg_img_01.png"" alt="log" style="width:40px;"/>
			</a>
			
			<ul class="navbar-nav">
				<!--links : (li.nav-item>a.nav-link{link $})*3-->
				<li class="nav-item"><a href="" class="nav-link">link 1</a></li>
				<li class="nav-item"><a href="" class="nav-link">link 2</a></li>
				<li class="nav-item"><a href="" class="nav-link">link 3</a></li>
			</ul>
		</nav>
		<br />

		<form action="write_message.jsp" method="post" class="form-line">
		
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-user"></i></span>
				</div>
				<input type="text" name="guestName" class="form-control"/>
			</div>
			
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-lock"></i></span>
				</div>
				<input type="password" name="password" class="form-control"/>
			</div>
			
			<div class="input-group mb-2 mr-sm-2">
				<div class="input-group-prepend">
					<span class="input-group-text"><i class="fas fa-file-alt"></i></span>
				</div>
				<input type="text" name="message" class="form-control"/>
			</div>
		
			<input type="submit" class="btn btn-primary mb-2" value="방명록작성"/>
		</form>

		<c:if test="${ view_data.messageList.isEmpty()}">
			<p class="bg-danger text-white">등록된 메시지가 없습니다!</p>
		</c:if>

		<table class="table table-hover">
			<thead>
				<tr>
					<td>번호</td>
					<td>게스트이름</td>
					<td>비밀번호</td>
					<td>메시지</td>
					<td>삭제</td>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="message" items="${ view_data.messageList }">
				<tr>
					<td><a href="update_form.jsp?id=${message.id}&cp=${view_data.currentPage}">${message.id}</a></td>
					<td>${message.guestName}</td>
					<td>${message.password}</td>
					<td>${message.message}</td>
					<td><a href="delete_form.jsp?id=${message.id}&cp=${view_data.currentPage}"><i class="fas fa-trash-alt"></i></a></td>
				</tr>
			</c:forEach>
			</tbody>			
		</table>

	</div>
	<br />
	
	<div class="container">
	
		<ul class="pagination justify-content-center">
			<c:set var="page" value="${ (empty param.page) ? 1: param.page }"/>
			<c:set var="startPage" value="${ page-(page-1)%view_data.perPage }"/>
			<c:set var="endPage" value="${ (startPage+9) >= view_data.pageTotalCount ? pageTotalCount : startPage+9 }"/>
			
			<c:if test="${ startPage!=1 }">
				<li class="page-item"><a href="list.jsp?page=1" class="page-link"><i class="fas fa-fast-backward"></i></a></li>
				<li class="page-item"><a href="list.jsp?page=${ startPage - 10 }" class="page-link"><i class="fas fa-backward"></i></a></li>
			</c:if>
			<c:forEach var="page_num" begin="${ startPage }" end="${ endPage }">
				<li class="page-item"><a href="list.jsp?page=${page_num}" class="page-link">${page_num}</a></li>
			</c:forEach>
			<c:if test="${ endPage < view_data.pageTotalCount }">
				<li class="page-item"><a href="list.jsp?page=${ endPage + 1}" class="page-link"><i class="fas fa-forward"></i></a></li>
				<li class="page-item"><a href="list.jsp?page=${ view_data.getPageTotalCount() }" class="page-link"><i class="fas fa-fast-forward"></i></a></li>
			</c:if>
		
		
		</ul>
	
	
	</div>
	
</body>
</html>








