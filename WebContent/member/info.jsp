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
<title>info</title>
</head>
<body>
	<h1>WebContent/member/info.jsp</h1>
	
	<%
		// 로그인 한 회원의 모든 정보를 출력 페이지
	
		// 1) 로그인 세션 제어
		String id = (String)session.getAttribute("id");
		// 2) DB에 있는 회원 정보 모두를 가져오기
		
		// 1. 드라이버 로드
		final String DRIVER ="com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		// 2. 디비연결
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		// 3. sql 작성 & pstmt객체
		String sql = "select * from itwill_member where id = ?";
		
		PreparedStatement pst = conn.prepareStatement(sql);
		// ?
		pst.setString(1, id);
		// 4. sql 실행
		ResultSet rs = pst.executeQuery(); 
		
		// 5. 데이터 처리
		// 3) 화면에 출력
		
		if(rs.next()){
			
			out.println("아이디 : "+rs.getString("id")+"<br>");
			out.println("비밀번호 : "+rs.getString("pass")+"<br>");
			out.println("이름 : "+rs.getString("name")+"<br>");
			out.println("나이 : "+rs.getString("age")+"<br>");
			out.println("성별 : "+rs.getString("gender")+"<br>");
			out.println("이메일 : "+rs.getString("email")+"<br>");
			out.println("회원 가입일 : "+rs.getTimestamp("reg_date")+"<br>");
		}
		
		// 자원 해제 : 사용한 객체의 역순으로 해제
		rs.close();
		pst.close();
		conn.close();
	
	%>
	
	<a href="main.jsp">메인페이지로 이동하기....</a> <br>
	
	
	
	
	
	
	
	
</body>
</html>