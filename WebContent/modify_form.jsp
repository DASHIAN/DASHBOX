<%@page import="com.lec.member.dto.Member"%>
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
		<% Member member = (Member) request.getAttribute("member"); %>
		<div class="container" align="center"> 
			<h3>회원정보수정하기</h3>
			<form action="modify" method="post" class="form-group">
				         <table class="table table-dark mt-md-5">
            <tr>
               <td style="width:20%">아이디</td>
               <td><input type="text" class="form-control" value="<%= member.getId() %>" disabled></td>
            </tr>
            <tr>
               <td>이름</td>
               <td><input type="text" class="form-control" name="name" value="<%= member.getName() %>"></td>
            </tr>
            <tr>
               <td>비밀번호</td>
               <td><input type="password" class="form-control" name="pw" value="<%= member.getPassword() %>"></td>
            </tr>
            <tr>
               <td>주민번호</td>
               <td><input type="text" class="form-control" name="ssn" value="<%= member.getRegNumber() %>"></td>
            </tr>
            <tr>
            	<td>성별</td>
            	<td>
            		<div class="form-group ml-sm-2" style="text-align: center; margin: 0 auto;">
            			<div class="btn-group" data-toggle="buttons">
            				<label for="" class="btn btn-info active">
            					<input type="radio" name="gender" autocomplete="off" value="M" 
            						<% if(member.getGender().equalsIgnoreCase("M")){%> checked <%}%>/>남
            				</label>
            				<label for="" class="btn btn-info active">
            					<input type="radio" name="gender" autocomplete="off" value="F" 
            						<% if(member.getGender().equalsIgnoreCase("F")){%> checked <%}%>/>여
            				</label>
            			</div>
            		</div>
            	</td>
            </tr>
            <tr>
            	<td>마일리지</td>
            	<td><input type="text" class="form-control" name="mileage" value="<%= member.getMileage() %>"></td>
            </tr>
            
         </table>
        	 <input type="hidden" name="id" value="<%=member.getId() %>"/>
         	 <input type="submit" class="btn btn-success mr-sm-3" value="회원정보 수정하기"/>
         	 <input type="reset" class="btn btn-success mr-sm-3" value="새로고침"/>
         
			</form>
		</div>
</body>
</html>