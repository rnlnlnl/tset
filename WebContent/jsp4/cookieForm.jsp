<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookieForm</title>
</head>
<body>
	<h1>WebContent/jsp4/cookieForm.jsp</h1>
	<%
		// 메세지 출력 ("안녕하세요 쿠키연습!"/"Hello,Cookie Test!!")
		// cookiePro.jsp로 언어 정보를 전달 (라디오버튼)
		// 생성된 쿠키정보에 따른 출력
		// 9.출력을 위한 언어정보 저장 변수
		String lang = "kor";
		// 6. 생성된 쿠키값에 따라서 출력되는 메세지 변경
		// 7. 쿠키값을 request객체에서 가져온다
		Cookie[] cookies = request.getCookies();
	
		// 8. 쿠키 배열의 값을 모두 비교한후 원하는 정보 저장
		if(cookies != null){
			 for(int i =0; i<cookies.length; i++){
				 if(cookies[i].getName().equals("lang")){
					 out.print(cookies[i].getValue());
					 lang = cookies[i].getValue();
//					 if(cookies[i].getValue().equals("kor")){
//						 <script type="text/javascript">
//						 	alert("안녕하세요 쿠키연습!");
//						 </script>			  
//				 }else if(cookies[i].getValue().equals("eng")){
 						 
//						<script type="text/javascript">
//					 		alert("Hello, Cookie Test!");
//					 	</script>
				}
			}
		}
//		}else{
//			 <script type="text/javascript">
//			 	alert("선택하신 쿠키가 없습니다.");
//			 </script>
			 
		 
		// 10. 결과 출력
		if(lang.equals("kor")){
			out.print("안녕하세요 쿠키연습!");
		}else{
			out.print("Hello, Cookie Test!");
		}
		// 1.쿠키값을 생성하기 위한  데이터를 전달
		
	%>
	<form action="cookiePro.jsp" method="post">
		<input type="radio" name="language" value="kor" 
		       <%if(lang.equals("kor")){ %> checked="checked" <%} %>> 한국어
		<input type="radio" name="language" value="eng" 
				<%if(lang.equals("eng")){ %> checked="checked" <%} %>> 영어 <br>
		<input type="submit" value="언어설정하기">
	</form>
	
</body>
</html>