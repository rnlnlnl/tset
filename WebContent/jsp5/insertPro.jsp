<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertPro.jsp</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	%>
	<%
		String id = request.getParameter("id");
		String pass = request.getParameter("pass");
		String email = request.getParameter("email");
	%>
	
	아이디 : <%=id%><br>
	비밀번호 : <%=pass%><br>
	이메일 : <%=email%><br>
	
	<h2>JSP - MySQL연결 (JDBC 사용)</h2>
	
	<%	
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		// 0) 라이브러리 설치
		// 1) 드라이브 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공!");
		// 2) 디비 연결(드라이버)
		Connection conn = DriverManager.getConnection(DBURL,DBID,DBPW); // 이 구문을 유지 해야 
		System.out.println("디비 연결 성공");
		System.out.println("연결 정보 : "+conn);
		
		// 3) sql 쿼리 작성 & stmt 실행 객체
		//String sql = "insert into itwill_member(id,pass,email) values('"+id+"','"+pass+"','"+email+"')";
		
		String sql = "insert into itwill_member(id,pass,email) values(?,?,?)";
		
		
		
		// Statement는 인터페이스인데  이인터페이스는 new를 사용할수 없다 
		// Statement객체 : jdbc사용해서 SQL구문을 작성하고, 실행하도록 도와주는 객체
		//Statement stmt = conn.createStatement();
		// PreparedStatement객체 : jdbc사용해서 SQL구문을 작성하고, 실행하도록 도와주는 객체
		// sql을 미리 가져가서 사용 준비중이다
		PreparedStatement pstmt = conn.prepareStatement(sql); //보안적으로도 우수하다 sql구문을 외부로 노출하지 않아서
		
		// ? 값 넣기
		// DB테이블에 있는 컬럼의 타입에 따라서 메서드가 변경
		// pstmt.setXXXXX(?위치 , ? 들어갈값);
		pstmt.setString(1, id);
		pstmt.setString(2, pass);
		pstmt.setString(3, email);
		
		
		// 4) SQL 구문 실행
		//stmt.executeUpdate(sql);
		pstmt.executeUpdate(); // insert, update, delete 구문 실행시 사용
		
		//pstmt.executeQuery(); // select 구문 실행시 사용
		
		
		System.out.println("insert구문 실행 완료!");
		
		
		
		
		
	%>
	
	
	
	
</body>
</html>