<%@page import="org.apache.commons.io.FileUtils"%>
<%@page import="java.io.File"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	// localhost:8088/jsp05_file/jsp08_fileutils.jsp?f=파일이름
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String src = "D:/temp/" + fileName;
	String des = "D:/temp/download/";
	
	File srcFile = new File(src);
	File desDir = new File(des);
	
	FileUtils.copyFileToDirectory(srcFile, desDir);
	
	out.println("<h3>파일이 성공적으로 다운로드 되었습니다!!");
%>