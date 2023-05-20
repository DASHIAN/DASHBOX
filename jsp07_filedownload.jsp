<%@page import="java.io.File"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.io.FileInputStream"%>
<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");
	String fileName = request.getParameter("f");
	
	String fromPath = "D:/temp/" + fileName;
	String toPath = "D:/temp/download/" + fileName;

	/*
		실제웹서버운영시에 관련된 경로
		ServletContext context = getServletContext(); // 현재웹컨테이너의 root폴더 즉, WebContent
		String downPath = context.getRealPath("upload");
		String saveFilePath = "D:/lec03/00.share/97.temp/download/" + fileName;
		out.println("<h3>Context      = " + context + "</h3>");
		out.println("<h3>downPath     = " + downPath + "</h3>");
		out.println("<h3>saveFilePath = " + saveFilePath  + "</h3>");
	*/

	byte[] b = new byte[4096];
	File f = new File(toPath);
	FileInputStream fis = new FileInputStream(fromPath);
	
	String sMimeType = getServletContext().getMimeType(fromPath); // mimetype = txt, hwp, pdf...
	if(sMimeType == null) sMimeType = "application/octet-stream";
	
	String sEncoding = new String(fileName.getBytes("utf-8"), "8859_1");
	String sEncoding1 = URLEncoder.encode(fileName, "utf-8");
	
	response.setContentType(sMimeType);
	response.setHeader("Content-Transfer-Encoding", "binary");
	response.setHeader("Content-Disposition", "attatchment; filename = " + sEncoding1);
	
	ServletOutputStream os = response.getOutputStream();
	int numRead;
	
	while((numRead = fis.read(b, 0, b.length)) != -1) {
		os.write(b, 0, numRead);	
	}
	
	os.flush();
	os.close();
	fis.close();
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
	<h1>파일다운로드하기</h1>
</body>
</html>