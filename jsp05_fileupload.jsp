<%@page import="java.util.Enumeration"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%
	String uploadPath = request.getRealPath("upload");
//	out.println("<h3>"+uploadPath+"<h3>");
	uploadPath="d:/temp";
	
	String name = "";
	String subject = "";
	String filename1 = "";
	String filename2 = "";
	String orgfilename1 = "";
	String orgfilename2 = "";
	int size = 1024*1024*1024; // 10mb
	
	try{
		MultipartRequest multi = new MultipartRequest(
					request,
					uploadPath,
					size,
					"utf-8",
					new DefaultFileRenamePolicy());
		name = multi.getParameter("name");
		subject = multi.getParameter("subject");
		Enumeration files = multi.getFileNames();
		
		String file1 = (String)(files.nextElement());
		filename1 = multi.getFilesystemName(file1);
		orgfilename1 = multi.getOriginalFileName(file1);
		
		String file2 = (String)(files.nextElement());
		filename2 = multi.getFilesystemName(file2);
		orgfilename2 = multi.getOriginalFileName(file2);
		
	}catch(Exception e){
		e.printStackTrace();
	}
	
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
		<h3>파일업로드</h3>
		<form action="jsp06_filecheck.jsp" method="post" name="filecheck">
			<input type="hidden" name="name" value="<%=name %>"/>
			<input type="hidden" name="subject" value="<%=subject %>"/>
			<input type="hidden" name="filename1" value="<%=filename1 %>"/>
			<input type="hidden" name="filename2" value="<%= filename2%>"/>
			<input type="hidden" name="orgfilename1" value="<%=orgfilename1 %>"/>
			<input type="hidden" name="orgfilename2" value="<%=orgfilename2 %>"/>
		</form>
		<a href="#" class="btn btn-primary" onclick="javascript:filecheck.submit()">
		파일업로드확인 및 다운로드페이지로 이동하기</a>
	</div>
</body>













</html>