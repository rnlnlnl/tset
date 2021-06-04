<%@page import="java.sql.Timestamp"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.mysql.fabric.xmlrpc.base.Data"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertPro</title>
</head>
<body>
	<h1>WebContent/member/insertPro.jsp</h1>
	<%
		request.setCharacterEncoding("UTF-8");
		
		// 전달정보 저장(파라미터)
		// id,pw,name,age,gender,email
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender  = request.getParameter("gender");
		String email = request.getParameter("email");
		
		// 날자정보 생성						     내컴퓨터의 시간을 가지고 온다
		Timestamp reg_date = new Timestamp(System.currentTimeMillis());
		
		// DB연결후 회원 가입
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1. 드라이버 로드
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공");
		
		// 2. 디비 연결
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		// 3. sql(insert) & pstmt 객체
		String sql = "insert into itwill_member values(?,?,?,?,?,?,?)";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setString(1, id);
		pst.setString(2, pw);
		pst.setString(3, name);
		pst.setInt(4, age);
		pst.setString(5, gender);
		pst.setString(6, email);
		pst.setTimestamp(7, reg_date);
		
		
		// 4. sql 실행
		pst.executeUpdate();
		System.out.println("회원가입 성공");
		// 로그인 페이지로 이동(loginForm.jsp)
//		response.sendRedirect("loginForm.jsp");
	%>
	
	<script type="text/javascript">
		alert("회원가입 성공! 로그인 페이지로 이동");
		location.href="loginForm.jsp";
	</script>
	
	
	
	
	
	
	
</body>
</html>