<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>sessionLoginPro</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionLoginPro.jsp</h1>
	<%
	 // 1. 로그인 페이지에서 사용자의 정보(id,pw)입력
	 // 2. 로그인 처리 페이지(sessionLoginPro.jsp) 이동
	 // 3. 전달된 회원의 정보를 저장 / 본인정보와 비교 (itwill/1234)
	 // 4. 로그인 체크 로직 (아이디와 비밀번호가 맞는지)
	 // 4-1. 아이디O => 비밀번호 체크/ 아이디X => 비회원 알림
	 // 4-2. 비밀번호 O => 본인(로그인 성공) / 비밀번호 X => 본인(비밀번호 오류)
	 // 5. 로그인 성공시 페이지 이동(sessionMain.jsp)
	 // 6. 로그인 성공 여부를 판단
	%>
	
<%--  	<%
		String id1 = (String)session.getAttribute("id1");
		String pw1 = (String)session.getAttribute("pw1");	
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		if(id.equals(id1)){
			if(pw.equals(pw1)){
	%>
			<script type="text/javascript">
				location.href='sessionMain.jsp';
			</script>
	<%
			}else{
	%>			
				<script type="text/javascript">
					alert("비밀번호 오류");
					location.href='sessionLogin.jsp';
				</script>
	<%			
			}
			
		}else{
	%>			
			<script type="text/javascript">
				alert("비회원");
				location.href='sessionLogin.jsp';
			</script>
	<%		
		}
	%> --%>
	
	
	
	<!-- 쌤꺼 -->
 	<% 
	// * 전달된 정보 저장(파라미터 id,pw)
	
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		out.println(id+pw);
		// 본인정보 비교(itwill/1234)
		String userID ="itwill";
		String userPW = "1234";
		
		// == / equals()
		// 1) A == B : 논리형데이터(boolean)리턴
		// -기본형 : 기본형 값 비교
		// -참조형 : 객체의 주소를 비교
		System.out.println(id.toString()+"/"+id.hashCode());
		System.out.println(userID.toString()+"/"+userID.hashCode());
		// 2) A.equals(B) : 논리형데이터(boolean) 리턴
		// -참조형 다입의 값을 같은지 다른지 비교(String 타입)
		System.out.println(id.equals(userID));
		
		
		//로그인 처리 로직 
		//if(id == userID){
		if(id.equals(userID)){
			System.out.print("아이디 같음");
			if(userPW.equals(pw)){
				System.out.println("본인 - 로그인 성공");
				
				// 세션영역에 로그인 성공시 일벽한 id값을 저장
				// -> 세션영역에서 항상 확인 가능
				session.setAttribute("id", id);
				
				//페이지 이동
				response.sendRedirect("sessionMain.jsp");
			}else{
				System.out.println("아이디 같음 , 비밀번호 오류");
			}
		}else{
			System.out.print("아이디 다름");
		}
	%>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>