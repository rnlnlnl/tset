<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%-- include로  지정된 파일에서 변수를 끌고와 쓸수있다 파일이 깨끗하게 보기가 참 개안다--%>
<%@ include file="myColor.jspf" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>main</title>	
</head>
<%
	String page_color = "gray";
%>

<%-- <body bgcolor='<%=page_color%>'> --%>
<body bgcolor="<%=myCol1%>">
	<h1>WebContent/jsp2/main.jsp</h1>
	<h2>웹페이지 템플릿</h2>
	<table border="1" width="600" height="600" bgcolor="aqua">
		<tr>
			<td colspan="2" height="100" bgcolor="green">
					<jsp:include page="top.jsp"> 
						<jsp:param value="itwill" name="id"/>
					</jsp:include>
			</td>
		</tr>
		<tr>
			<td width="100">
				<jsp:include page="left.jsp"/>
			</td>
			<td>Center</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
				<jsp:include page="bottom.jsp"/>
			</td>
		</tr>
		
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>