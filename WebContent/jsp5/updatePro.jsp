<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>updatePro</title>
</head>
<body>
	<h1>WebContent/jsp5/updatePro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		//전달된 파라미터값 저장 / 출력(pass)
		String pass = request.getParameter("pass");
		String id = request.getParameter("id");
	%>
	
	수정할 비밀번호 : <%=pass%><br> 
	아이디 : <%=id%><br>
	<%
		// 디비 연결정보
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1) 드라이버로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공!");
		// 2) 디비 연결
		Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
		System.out.println("DB연결 성공!");
		
		// 3) sql 작성 & pstmt 객체생성
		String sql = "update itwill_member set pass=? where id = ?";
		// 3-1) ? 처리
		PreparedStatement pstmt = conn.prepareStatement(sql);
		
		pstmt.setString(1, pass);
		pstmt.setString(2, id);
		
		// 4) sql 실행
		pstmt.executeUpdate();
	%>	
	
	
	
	
	
	
	
</body>
</html>