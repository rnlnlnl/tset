<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionSet.jsp</h1>
	<%
		// 세션객체 생성(이미 생성 완료 -내장객체)
		
		// 세션 정보(값)생성
		//session.setAttribute("이름", "값");
		//							  모든타입을 담을수있다.
		session.setAttribute("name", "ITWILL");
		session.setAttribute("tel", "010-1234-4567");
		
		System.out.print("sesstion 생성");
		// 페이지 이동(sessionTest.jsp) - js(자바스크립트)
		
	%>
	<script type="text/javascript">
		alert("세션값 생성 완료 후 페이지 이동!");
		location.href='sessionTest.jsp';
		
		
	</script>
</body>
</html>