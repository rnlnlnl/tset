<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deleteForm</title>
</head>
<body>
	<h1>WebContent/board/deleteForm.jsp</h1>
	
	<h2> 글 삭제 페이지 </h2>
	<!-- 사용자로부터 글 비밀번호를 입력 받아서 처리 페이지로 이동 -->
<%	
	//전달된 정보 저장 (num,pageNum)
	int num = Integer.parseInt(request.getParameter("num"));
	String pageNum = request.getParameter("pageNum");
	
	
	
%>	
	
	<form action="deletePro.jsp?pageNum=<%=pageNum%>" method="post">
		<input type="hidden" name="num" value="<%=num%>">
		비밀번호: <input type="password" name="pass"><br>
		<input type="submit" value="삭제하기">
		<button onclick="location.href='list.jsp'">돌아가기</button>
	</form>
		
	
	
</body>
</html>