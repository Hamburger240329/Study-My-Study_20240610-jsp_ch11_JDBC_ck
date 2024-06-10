<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String sno = request.getParameter("sno");
		String name = request.getParameter("name");
		String dept = request.getParameter("dept");
		
		String sql = "INSERT INTO student_tbl(sno, name, dept) VALUES ('"+sno+"', '"+name+"', '"+dept+"')";
		
		String driverName = "com.mysql.jdbc.Driver"; // my sql 에서 제공하는 드라이버 이름 고정 값 - 오타 발생할 경우 에러 발생함 : com.mysql.jdbc.Driver
		String url = "jdbc:mysql://localhost:3306/school_db";//DB가 설치된 주소 - 연결할 DB의 스키마를 지정 : school_db
		String username = "root"; // 관리자 계정 이름
		String password = "12345"; // 관리자 계정 비밀번호
		
		Connection conn = null;// DB와의 커넥션 생성
		Statement stmt = null;
		
		try {
			Class.forName(driverName); // mt sql 드라이버 불러오기
			
			conn = DriverManager.getConnection(url, username, password); // DB와의 커넥션 생성
			stmt = conn.createStatement();
			
			int resultNum = stmt.executeUpdate(sql);
			
			if(resultNum == 1){
				out.println("회원가입 성공!!");
			} else {
				out.println("회원가입 실패!");
			}

		} catch(Exception e){
			out.println("DB 연결 실패!! 회원가입 실패!");
			e.printStackTrace(); // 에러발생시 에러의 내용을 콘솔창에 출력
		} finally { // db 에러의 발생여부와 상관없이 무조건 실행
			try{
				if(stmt != null){ // connection 의 null 이 아닐때만 close 실행
					stmt.close();
				}
				if(conn != null){ // connection 의 null 이 아닐때만 close 실행
					conn.close();
				}
			} catch (Exception e){
				e.printStackTrace();
			}
		}		
		
	%>
	
	
</body>
</html>