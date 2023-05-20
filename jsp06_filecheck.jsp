<%@page import="java.net.URLEncoder"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String name = request.getParameter("name");
	String subject = request.getParameter("subject");
	String filename1 = request.getParameter("filename1");
	String filename2 = request.getParameter("filename2");
	String orgfilename1 = request.getParameter("orgfilename1");
	String orgfilename2 = request.getParameter("orgfilename2");
	
	// 크롬에서는 한글을 인코딩하지 않아도 자동으로 인코딩해서 전달하지만
	// IE에서는 인코딩을 수동으로 처리해서 전달해야 한다.
	
	filename1 = URLEncoder.encode(filename1, "utf-8");
	filename2 = URLEncoder.encode(filename2, "utf-8");
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
		<h3>파일업로드확인 및 다운로드하기</h3>
		<table class="table table-dark text-light">
			<tr>
				<td width="20%">업로드한 사람</td>
				<td><%= name %></td>
			</tr>
			<tr>
				<td>제목</td>
				<td><%= subject %></td>
			</tr>	
			<tr>
				<td>파일1</td>
				<td><a href="jsp07_filedownload.jsp?f=<%= filename1 %>" class="btn btn-success"><%= orgfilename1 %></a></td>
			</tr>
			<tr>
				<td>파일2</td>
				<td><a href="jsp07_filedownload.jsp?f=<%= filename2 %>" class="btn btn-success"><%= orgfilename2 %></a></td>
			</tr>		
		</table>
	</div>
</body>
</html>







