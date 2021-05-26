<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionMain</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionMain.jsp</h1>
	<h2>메인 페이지</h2>
	<%
	 // 1. 로그인 페이지에서 사용자의 정보(id,pw)입력
	 // 2. 로그인 처리 페이지(sessionLoginPro.jsp) 이동
	 // 3. 전달된 회원의 정보를 저장 / 본인정보와 비교 (itwill/1234)
	 // 4. 로그인 체크 로직 (아이디와 비밀번호가 맞는지)
	 // 4-1. 아이디O => 비밀번호 체크/ 아이디X => 비회원 알림
	 // 4-2. 비밀번호 O => 본인(로그인 성공) / 비밀번호 X => 본인(비밀번호 오류)
	 // 5. 로그인 성공시 페이지 이동(sessionMain.jsp)
	 // 6. 로그인 성공 여부를 판단
	%>
	
	<%
		// 세션 영역객체의 값을 사용해서 로그인 체크 여부
		String id = (String)session.getAttribute("id");
		
		if(id == null){
			// 로그인 X
			response.sendRedirect("sessionLogin.jsp");
		}
		
		
	%>
		<h2><%=id%>님 로그인 환영 합니다.</h2>
		
	<hr>	
	
	<input type="button" value="로그아웃" onclick="location.href='sessionLogout.jsp';">
		
	
	
<%-- <%String id1 = (String)session.getAttribute("id1"); %>
	<h2><%=id1%>님로그인 성공</h2> --%>
	
</body>
</html>