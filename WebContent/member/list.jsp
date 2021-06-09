<%@page import="java.sql.Timestamp"%>
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
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/list.jsp</h1>
	
	<h2>회원 전체 목록 확인 </h2>
	<%
	
	// 세션 제어 (로그인O, admin O)
	String id = (String)session.getAttribute("id");
	if(id==null || !id.equals("admin")){
		response.sendRedirect("main.jsp");
	}
	
	// DB에서 모든 회원 정보 출력 (관리자 제외)
	final String DRIVER = "com.mysql.jdbc.Driver";
	final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
	final String DBID = "root";
	final String DBPW = "1234";
	// 1.드라이버 로드	
	Class.forName(DRIVER);
	// 2. 디비연결
	Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
	// 3. sql 작성&pst객체 생성
	String sql = "select * from itwill_member where id != 'admin'";
	
	PreparedStatement pst = conn.prepareStatement(sql);
	// 4. sql 실행
	ResultSet rs = pst.executeQuery();
	// 5. 데이터 처리
	
	%>	
		<table border="1">
			<tr>
				<td>아이디</td>
				<td>비밀번호</td>
				<td>이름</td>
				<td>나이</td>
				<td>성별</td>
				<td>이메일</td>
				<td>가입일자</td>
			</tr>
	<%
	
	// Timestamp c = ; 초기값 사용 불가
	
	while(rs.next()){
		id = rs.getString("id");
		String pw = rs.getString("pass");
		String name = rs.getString("name");
		int age = rs.getInt("age");
		String gender = rs.getString("gender");
		String email = rs.getString("email");
		Timestamp joindate = rs.getTimestamp("reg_date");
	%>		
			
			<tr>
				<td><%=id %></td>
				<td><%=pw %></td>
				<td><%=name %></td>
				<td><%=age %></td>
				<td><%=gender %></td>
				<td><%=email %></td>
				<td><%=joindate %></td>
			</tr>
	<%	
	}
	%>
		</table>
	
</body>
</html>