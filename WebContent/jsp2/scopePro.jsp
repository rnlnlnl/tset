<%@page import="java.nio.channels.SeekableByteChannel"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>전달받은 값 나타내기</title>
</head>
<body>
	<%request.setCharacterEncoding("UTF-8"); %>
	<%
		// 영역객체를 생성(데이터-속성을 생성)
		pageContext.setAttribute("pc", "페이지 영역에 저장된 값!!!!");
		request.setAttribute("rq", "request 영역 정보 저장!!!");
		session.setAttribute("se", "session영역 정보 저장!!!");
		application.setAttribute("ap", "application 영역 정보 저장!!!");
	%>
	<h1>WebContent/jsp2/scopePro.jsp</h1>
	
	
	<%-- getParameter로 가져오기 --%>
	<%String id = request.getParameter("id"); %>
	아이디 : <%=id %>
	
	<%-- session 으로  id값을 넘기는 방법 --%>
	<%--<%session.setAttribute("id", id);%> --%>
	
	<h2> 영역 객체 정보 출력<br>(포함관계 : application>session>request>pageContext)</h2>
	pageContext 객체 정보 (pc속성값을 출력): <%=pageContext.getAttribute("pc") %><br>
	request 객체 정보 : <%=request.getAttribute("rq") %><br>
	session 객체 정보 : <%=session.getAttribute("se") %><br>
	application 객체 정보 : <%=application.getAttribute("ap") %><br>
	<%-- 객체 정보를 가지고 있는 시간/공간에 따라 아래로 갈수록 커진다 --%>
	
	<%-- --------------------------------------------------------------------------------------------- --%>
	
	<h2> 페이지 이동(+ 데이터) </h2>
	
	<h3>1) a태그 이동 (파라미터, session, application 정보 사용 O)</h3>
									<%--파라미터로 id값 넘기기 --%>
		<a href="scopeProAction.jsp?id=<%=id %>&pw=1234" >scopeProAction.jsp 페이지 이동</a>
	
	<%-- --------------------------------------------------------------------------------------------- --%>
	<h3>2) javascript사용 이동 (파라미터, session, application 정보 사용 O)</h3>
		
		<script type="text/javascript">
			//alert("자바스크립트 사용 페이지 이동");
			//location.href='scopeProAction.jsp?id=<%=id%>&pw=1234';
		</script>
	
	<%-- --------------------------------------------------------------------------------------------- --%>
	<h3>3) jsp사용 이동 (session, application 정보 사용 O)</h3>
		<%
			response.sendRedirect("scopeProAction.jsp?id="+id+"&pw=1234");
		%>
	
	<%-- --------------------------------------------------------------------------------------------- --%>
	<h3>4) 액션 태그샤용 이동</h3>
	
	<h5>번외) ajax사용 이동</h5>
	
	
	
	
	
	<%-- getAttribute로 가져오기 --%>
	<%=request.getAttribute("id") %>
	
	
	
	
	
	
	
</body>
</html>