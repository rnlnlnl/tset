<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionLogout</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionLogout.jsp</h1>
	
	<%
	// 로그아웃  -> 세션값 삭제(초기화)
	session.invalidate();
	// 페이지 이동
	
	%>
	<script type="text/javascript">
		alert("로그아웃 성공");
		location.href="sessionMain.jsp";
	</script>
	
</body>
</html>