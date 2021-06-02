<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>DBConnect</title>



</head>
<body>
	<h1>WebContent/jsp5/DBConnect.jsp</h1>
	<%
		//JDBC를 사용하여 mysql과 연결
		
		// 0) 필요한 드라이버 설치 (API/라이브러리)
		// webcontent/WEB-INF/lib/mysql-connector-java-5.1.49.jar
		// 파일 복사 완료 / 프로젝트당 1번씩만 필요
		// 1) 설치된 드라이버를 로드 
		// 첫글자가 대문자이면 자바의 구문이다
		Class.forName("com.mysql.jdbc.Driver");
		// mysql을 사용하는 드라이버 주소
		
		System.out.print("드라이버 로드 성공!");
		// 2) 드라이버를 사용 해서 디비연결
		Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspdb", "root", "1234");
		
		System.out.print("디비 연결 성공!");
		System.out.print("연결정보 : "+conn);
		
		
		
	%>
	
	
	
	
</body>
</html>