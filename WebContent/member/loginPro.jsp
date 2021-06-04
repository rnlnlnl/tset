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
<title>loginPro</title>
</head>
<body>
	<h1>WebContent/member/loginPro.jsp</h1>
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보 (id,pw)저장 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		// DB 접근해서 로그인 여부 판단
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공");
		
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		String sql = "select id, pass from itwill_member where id = ? ";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setString(1, id);
//		pst.setString(2, pw);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()){
				if(pw.equals(rs.getString("pass"))){
					//로그인 성공
					session.setAttribute("id", id);
					%>
					<script type="text/javascript">
						alert("환영합니다.");
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
		}else{
			%>
			<script type="text/javascript">
				alert("회원이 아닙니다.");
				history.back();
			</script>
			<%
		}
		// 회원 정보가 없을 경우 
		// 회원정보가 있지만 비밀번호가 틀린경우
		// => "메세지 전달", 페이지 뒤로 이동 
		
		// 회원 본인경우
		// => main.jsp 페이지로 이동, 로그인 상태 유지
		
		// + ID가 없을 경우 "비회원 입니다. 회원 가입 하시겠습니까?" Y/N
		//  Y- 회원가입 페이지로 이동  N- 페이지 뒤로가기
		
		
		
		
		
		
	%>
	
	
	
	
	
	
	
	
	
	
</body>
</html>