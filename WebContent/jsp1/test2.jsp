<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test2</title>
<script type="text/javascript">
	alert("hi");
</script>
</head>
<body>
	<h1>WebContent/jsp1/test2.jsp</h1>
	
	<h2> jsp : 객체지향 언어 (내장객체, document객체, 등등 )</h2>
	<h2> ** jsp : 내장객체 (p177~)</h2>
	<%
		//var TV = new Object();
		// TV = request 같은 의미이다
	%>
	
	<h3> javax.servlet 패키지(8개)(폴더)</h3>
		request : http 요청정보를 저장하는 객체<br>
		response : http 응답 정보를 저장하는 객체<br>
		session : 클라이언트 세션 정보를 저장 객체<br>
		page : 해당 페이지 정보를 저장하는 객체(서블릿 객체)<br>
		pageContext : 페이지에 필요한 실행 정보 저장 객체(프로젝트안에 있는 페이지 Context=페이지)<br>
		out : 응답 페이지를 출력하는 객체<br>
		application : 애플리케이션의 컨택스트(프로젝트) 정보를 저장하는 객체<br>
		config : 페이지에 필요한 서블릿 정보를 저장객체(초기화 정보)<br>
	
	<h3> java.lang 패키지(1개)</h3>
		exception : 예외 처리 객체<br>
	
	
</body>
</html>