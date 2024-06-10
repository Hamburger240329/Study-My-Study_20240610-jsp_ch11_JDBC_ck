<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
</head>
<body>
	<h2>회원가입</h2>
	<hr>
	<form action="memberjoinOk.jsp">
		회원번호 : <input type="text" name="sno"><br><br>
		회원이름 : <input type="text" name="name"><br><br>
		회원학과 : <input type="test" name="dept"><br><br>
		<input type="submit" value="회원등록">
	</form>
	
</body>
</html>