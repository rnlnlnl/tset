<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/updateForm.jsp</h1>
	
	<h2>회원정보 수정</h2>
	<!-- 
	 로그인 세션 제어
	
	 DB에서 정보를 가져와서 수정하기
	 아이디-수정불가, 비밀번호 표시 X
	 그외 나머지 정보는 모두 화면에 표시
	 -->
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
	
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		String sql = "select id, name, age, gender, email from itwill_member where id = ?"; 
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setString(1, id);
		
		ResultSet rs = pst.executeQuery();
		
		// 5. 데이터 처리
		String name = "";
		int age = 0;
		String gender = "";
		String email = "";
		if(rs.next()){
			// id = rs.getString("id");
			name = rs.getString("name");
			age = rs.getInt("age");
			gender = rs.getString("gender");
			email = rs.getString("email");
		}
		
		//성별의 정보가 없을 경우 기본값 설정
		if(gender == null){
			gender = "남";
		}
		
	%>
	
	<fieldset>
		<form action="updatePro.jsp" method="post">
			<pre>
			비밀번호 : <input type="password" name="pass" placeholder="수정전 비밀번호를입력하시오."><br>
			
			
			<%--아이디 : <input type="text" name="id" value="<%=id%>" disabled="disabled"><br> --%>
			아이디 : <input type="text" name="id" value="<%=id%>" readonly="readonly"><br>
			<!-- 
				readonly : 수정 X, 읽기 전용
				disabled : 사용 X => input태그 사용 불가판정
			 -->
			이름 : <input type="text" name="name" value="<%=name%>"><br>
			나이 : <input type="text" name="age" value="<%=age%>"><br>
			성별 : 남<input type="radio" name="gender" value="남" 
					<%if(gender.equals("남")){ %>
					checked
					<%} %>>&nbsp;
			          여<input type="radio" name="gender" value="여" 
			        <%if(gender.equals("여")){ %>
			        checked
			        <%} %>><br>
			이메일 : <input type="text" name="email" value="<%=email%>"><br>
				
			<hr>
			
			
			<input type="submit" value="수정하기">
			</pre>
		</form>
	</fieldset>
	
	
</body>
</html>