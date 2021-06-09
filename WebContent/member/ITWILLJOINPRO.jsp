<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinPro</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String pw1 = request.getParameter("pw1");
	String name = request.getParameter("name");
	String jumin1 = request.getParameter("jumin1");
	String jumin2 = request.getParameter("jumin2");
	String gender = request.getParameter("gender");
	String hobby = request.getParameter("hobby");
	String study = request.getParameter("study");
	String one = request.getParameter("one");
	
	
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	
	Class.forName(DRIVER);
	
	Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
	
	String sql = "insert into itwill_join values(?,?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement pst = conn.prepareStatement(sql);
	
	pst.setString(1, id);
	pst.setString(2, pw);
	pst.setString(3, pw1);
	pst.setString(4, name);
	pst.setString(5, jumin1);
	pst.setString(6, jumin2);
	pst.setString(7, gender);
	pst.setString(8, hobby);
	pst.setString(9, study);
	pst.setString(10, one);
	
	pst.executeUpdate();
	
	
	%>
	<script type="text/javascript">
		alert("회원가입 완료");
		location.href="ITWILLJOIN.jsp";
	</script>
	
	
</body>
</html>