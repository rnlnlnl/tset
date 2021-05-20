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
		
	<hr>
	
	서버 도메인명 : <%=request.getServerName() %><br>
	서버 포트번호 : <%=request.getServerPort() %><br>
	URL : <%=request.getRequestURL() %><br>
	URI : <%=request.getRequestURI() %><br>
	프로토콜 : <%=request.getProtocol() %><br>
	클라이언트 호스트명 : <%=request.getRemoteHost() %><br>
	클라이언트 IP주소 : <%=request.getRemoteAddr() %><br>
	
	페이지 요청방식 : <%=request.getMethod() %><br>
	컨텍스트정보(프로젝트 정보) : <%=request.getContextPath() %><br>
	물리적 경로 : <%=request.getRealPath("/") %><br>
	
	http 헤더 정보(user-agent) : <%=request.getHeader("user-agent") %><br>
	http 헤더 정보(accept-language) : <%=request.getHeader("accept-language") %><br>
	http 헤더 정보(host) : <%=request.getHeader("host") %><br>
	http 헤더 정보(connection) : <%=request.getHeader("connection") %><br>
	
	<hr>
	<%
		// response : 서버 -> 클라이언트 응답정보 저장
		//response.addHeader("Refresh", "3;url=/StudyJSP/jsp1/test2.jsp");  3초마다 해당 페이지 불러오기
		//response.setHeader("해더속성", 값);
		//response.addCookie("쿠키값");
		//response.setContentType("속성");
		//response.sendRedirect("페이지");
	%>
	
	<h2>session 객체</h2>
	session ID값 : <%=session.getId()%><br>
	세션생성 시간 : <%=session.getCreationTime() %><br>
	최종접속 시간 : <%=session.getLastAccessedTime() %><br>
	세션 유지시간(1800,30분) : <%=session.getMaxInactiveInterval() %><br> <!-- get은 =이있는 태그에 써야 하고 -->
 	<%
		// 세션 유지시간 60분으로 변경										//  set은 일반 스크립 태그에 써야한다.
		session.setMaxInactiveInterval(3600);
	%><br>
	세션 유지시간(3600,60분) : <%=session.getMaxInactiveInterval() %><br>
	
	서버정보 :<%=application.getServerInfo() %><br>
	서버의 물리적경로<%=application.getRealPath("/") %><br>
	
	<%
	out.print("안녕하세요.");
	out.print("안녕하세요.1");
	out.print("안녕하세요.2");
	out.print("안녕하세요.3");
	%>
	버퍼 사이즈 : <%=out.getBufferSize() %><br>
	사용후 버퍼 사이즈 : <%=out.getRemaining() %><br>
	
		
		
</body>
</html>