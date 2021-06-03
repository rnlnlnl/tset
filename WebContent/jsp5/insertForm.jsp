<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>insertForm</title>
</head>
<body>
	<h1>WebContent/jsp5/insertForm.jsp</h1>
	<!-- 
		insertForm.jsp 정보입력 
		insertPro.jsp 전달 후 전달된 정보를 DB에 저장
	 -->
	
	<form action="insertPro.jsp" method="post">
		<label>아이디 :</label>
		<input type="text" name="id"><br>
		<label>비밀번호 :</label>
		<input type="password" name="pass"><br>
		<label>이메일 :</label>
		<input type="text" name="email"><br>
		
		<input type="submit" value="정보전달">
	</form>
	
	
	
	
	
	
</body>
</html>