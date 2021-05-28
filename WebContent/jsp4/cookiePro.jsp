<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookiePro</title>
</head>
<body>
	<h1>WebContent/jsp4/cookiePro.jsp</h1>
	<%
		// 2.전달된 정보를 사용해서 쿠키값 생성
		// 복잡하게 만들었을때
//		String lang = request.getParameter("language");
//		Cookie cookie = new Cookie("lang",lang);
		Cookie cookie = new Cookie("lang",request.getParameter("language"));
		
		// 3.쿠키 설정값 지정 (1시간사용)
		cookie.setMaxAge(60*60);
		
		// 4. HHD에만 정보가 올라 가있어서 콘솔에서는 안보인다 
		// 그래서 쿠키정보를 클라이언트로 전달하게 한다
		response.addCookie(cookie);
		// 5.cookieForm.jsp 페이지 이동
		
	%>
	
	<script type="text/javascript">
		alert("언어 쿠키 정보를 생성!");
		location.href = "cookieForm.jsp";
	</script>
	
	
</body>
</html>