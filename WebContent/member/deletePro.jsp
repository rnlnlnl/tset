<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro</title>
</head>
<body>
	<h1>WebContent/member/deletePro.jsp</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
		
		String id = (String)session.getAttribute("id");
		
		String pass = request.getParameter("pass");
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		String sql = "select * from itwill_member where id = ?"; 
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setString(1, id);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("pass"))){
				sql = "delete from itwill_member where id = ?";
				
				pst = conn.prepareStatement(sql);
				
				pst.setString(1, id);
				
				pst.executeUpdate();
				
				session.invalidate();
				%>
					<script type="text/javascript">
						alert("삭제되었습니다");
						location.href="main.jsp";
					</script>
				<%
				
			}else{
				%>
					<script type="text/javascript">
					alert("비밀번호가 틀렸습니다.");
					history.back();
					</script>
				<%
			}

		}
		
	%>

	
</body>
</html>