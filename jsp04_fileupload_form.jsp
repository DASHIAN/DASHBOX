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
      <h3>파일업로드하기</h3>
      <form action="jsp05_fileupload.jsp" method="post" enctype="multipart/form-data" class="form-group">
      
         <table class="table table-hover">
            <tr>
               <td width="20%">업로드한 사람</td>
               <td><input type="text" name="name" class="form-control" value="홍길동" ></td>
            </tr>
            <tr>
               <td>제목</td>
               <td><input type="text" name="subject" class="form-control" value="파일업로드 및 다운로드하기" ></td>
            </tr>
            <tr>
               <td>파일1</td>
               <td><input type="file" name="filename1" class="form-control"></td>
            </tr>
            <tr>
               <td>파일2</td>
               <td><input type="file" name="filename2" class="form-control"></td>
            </tr>
         </table>
         <input type="submit" class="btn btn-primary" value="파일업로드">
      </form>
   </div>
</body>
</html>