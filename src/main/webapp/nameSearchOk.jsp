<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 확인</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
	
		String searchName = request.getParameter("name");
		
		String sql = "SELECT * FROM student_tbl WHERE name='"+searchName+"'";
		
		String driverName = "com.mysql.jdbc.Driver"; // my sql 에서 제공하는 드라이버 이름 고정 값 - 오타 발생할 경우 에러 발생함 : com.mysql.jdbc.Driver
		String url = "jdbc:mysql://localhost:3306/school_db";//DB가 설치된 주소 - 연결할 DB의 스키마를 지정 : school_db
		String username = "root"; // 관리자 계정 이름
		String password = "12345"; // 관리자 계정 비밀번호
		
		Connection conn = null;// DB와의 커넥션 생성
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			Class.forName(driverName); // mt sql 드라이버 불러오기
			
			conn = DriverManager.getConnection(url, username, password); // DB와의 커넥션 생성
			stmt = conn.createStatement();

			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				int sno= rs.getInt("sno");
				System.out.println(sno);
				String name = rs.getString("name");
				String dept = rs.getString("dept");
				
				out.println(sno + "/" + name + "/" + dept + "<br><br>");

			}
			
		} catch(Exception e){
			out.println("DB 연결 실패!! 회원목록 불러오기 실패!");
			e.printStackTrace();
		} finally {
			try{
				if(stmt != null){
					stmt.close();
				}
				if(conn != null){
					conn.close();
				}
			} catch (Exception e){
				e.printStackTrace();
			}
		}		
		
	%>
	
	
</body>
</html>