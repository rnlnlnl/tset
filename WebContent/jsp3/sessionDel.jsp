<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionDel</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionDel.jsp</h1>
	<%
		// 세션값 삭제
		session.removeAttribute("name");
		//session.removeAttribute("tel");
		// 페이지 이동(sessionTest.jsp)
		
	%>
	<script type="text/javascript">
		alert("세션값 삭제~~");
		location.href='sessionTest.jsp';
	</script>
</body>
</html>