<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>
</head>
<body>
	<h1>WebContent/member/main.jsp</h1>
	
	<h2>메인 페이지</h2>
	<!-- 로그인시 접근 가능한 페이지 -->
	<%
		// 세션 영역에 있는 정보를 저장
		
		// 정보가 없으면 로그인 페이지로 이동
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}else{ // 로그인 성공시 회원 아이디 출력
			%>
			<%=id%>님 환영합니다<br>
			<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
			<%
		}
	%>
	
	<hr>
	
	<a href="info.jsp">회원정보 조회 (select)</a>
	
	<a href="updateForm.jsp">회원정보 수정(update)</a>
	
	<a href="deleteForm.jsp">회원 탈퇴(delete)</a>
	
</body>
</html>