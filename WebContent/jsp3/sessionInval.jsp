<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionInval</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionInval.jsp</h1>
	<%
	// 세션 정보를 초기화 하기
	session.invalidate();
	%>
	
	<script type="text/javascript">
		alert("세션 초기화 !!");
		location.href='sessionTest.jsp';
	</script>
	
</body>
</html>