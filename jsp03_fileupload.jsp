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
	<div class="container" align="center">
		<form action="upload" method="post" enctype="multipart/form-data">
			text1: <input type="text" name="text1" class="mb-sm-2" value="홍길동"><br>
			file1: <input type="file" name="file1" class="mb-sm-2"><br>
			file2: <input type="file" name="file2" class="mb-sm-2"><br>
			<input type="submit" class="btn btn-primary" value="파일업로드">
		</form>
	</div>
</body>
</html>