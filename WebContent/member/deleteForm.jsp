<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>delete</title>
</head>
<body>
	<h1>WebContent/member/deleteForm.jsp</h1>
	<!-- 회원정보 삭제 -->
	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("main.jsp");
		}
		
		
		
		
		
		
		
	%>
	
	
	<form action="deletePro.jsp" method="post">
		<input type="text" name="id" value="<%=id%>">
		<input type="password" name="pass" placeholder="비밀번호를입력하시오.">
		
		<input type="submit" value="탈퇴하기">
	</form>
	
</body>
</html>