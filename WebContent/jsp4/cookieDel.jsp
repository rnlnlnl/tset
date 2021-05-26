<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookieDel</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieDel.jsp</h1>
	<h2> 서버 </h2>
	<%
		// 기존의 쿠키값 삭제
		
		// 1) 기존의 쿠키값 가져오기
		Cookie[] cookies = request.getCookies();
		
		// 2) 쿠키 배열을 처음부터 끝까지 검색 - 필요정보 확인
		if(cookies != null){
			for(int i =0; i<cookies.length; i++){
				if(cookies[i].getName().equals("name")){
					// 3) 쿠키값을 삭제 사용 시간을 0으로 만들어 주면 된다 
					// 쿠키값  데이터 자체의 사용시간 -> 0(파일삭제 X)
					// 파일을 살제해주는 메소드가 없다
					cookies[i].setMaxAge(0);
					
					// 4) 쿠키 삭제정보를 클라이언트로 전달해 쿠키가 삭제 됬다는걸 알려줘야함
					response.addCookie(cookies[i]);
					
				}
			}
		}
	%>
	<script type="text/javascript">
		alert("쿠키값을 삭제했습니다");
		location.href='cookieTest.jsp';
	</script>
	
	
	
</body>
</html>