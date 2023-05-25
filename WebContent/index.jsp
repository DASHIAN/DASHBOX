<%@page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
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
      <h3>회원관리</h3>
      <div class="form-group">
         <input type="button" class="btn btn-primary" value="로그인" onclick="location.href='login_form.jsp'">
         <input type="button" class="btn btn-primary" value="회원등록" onclick="location.href='register_form.jsp'">
      </div>
   </div>
</body>
</html>