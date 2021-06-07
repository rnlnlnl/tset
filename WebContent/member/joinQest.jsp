<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title></title>

<script type="text/javascript">
	
	function fun1() {
		location.href="insertForm.jsp";
	}
	
	function fun2() {
		history.back();
	}
	
	
</script>





</head>
<body>
	<h3>비회원 입니다 회원 가입 하시겠습니까?</h3>
	<input type="button" value="YES" onclick="fun1();">
	<input type="button" value="NO"  onclick="fun2();">
	
</body>
</html>