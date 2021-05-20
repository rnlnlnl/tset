<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testForm2</title>
</head>
<body>
	<h1>WebContent/jsp1/testForm2.jsp</h1>
	<!--  사용자의 나이, 이름을 입력받아서
		 testPro2.jsp 페이지에서 정보를 전달받은후 화면에 출력
	 -->
	<fieldset>
		<legend>나이, 이름을 입력하시오</legend>
		<form action="testPro2.jsp" method="post">
			<label>나이 :</label>
			<input type="text" name="age"><br>
			<label>이름 :</label>
			<input type="text" name="name"><br>
			<input type="submit" value="전달">
		</form>
	</fieldset>
	
	
</body>
</html>