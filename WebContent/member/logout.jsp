<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>logout</title>
</head>
<body>
	<h1>WebContent/member/logout.jsp</h1>
	<%
		// 로그아웃
		
		// 세션정보 초기화
		session.invalidate();
	%>
	<script type="text/javascript">
		alert("로그아웃 완료.");
		location.href="main.jsp";
	</script>
	

</body>
</html>