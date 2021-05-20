<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testForm1</title>
</head>
<body>
	<h1>WebContent/jsp1/testForm1.jsp</h1>
	<!--  해당 정보를 입력 받아서 다른 페이지로 전달 -->
	
	<form action="testPro1.jsp" method="get">
		<label>좋아하는 숫자 :</label>  
		<input type="text" name="num"><br>
		<input type="submit" value="전송">
		
		
		
	</form>
	
	
	
	
	
	
	
</body>
</html>