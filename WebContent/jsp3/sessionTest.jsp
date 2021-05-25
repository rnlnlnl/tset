<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>session</title>
</head>
<body>
	<h1>WebContent/jsp3/sessionTest.jsp</h1>
	<%
		//p270~
		
		/* 
		세션 : 웹 서버의 컨테이너 상태를 유지하기 위한 정보
		 -> 클라이언트 - 서버가이의 상태는 유지 X (페이지 요청후 연결 끊어짐)
		 * 웹 브라우저당 1개씩 생성
		 * 서버의 상태가 유지되기 때문에 안정적, 보안상 우수
		 * 웹 페이지 응답시(response) 세션 객체(정보)가 전달(쿠키영역에 저장)
		 
		세션값 생성
		 session.setAttribute("이름", "값");
		세션값 삭제
		 session.removeAttribute("이름");
		세션값 사용
		 session.getAttribute("이름");
		세션값 초기화
		session.invalidate();
		
		*/
		
		// 세션값 가져오기
		String name = (String)session.getAttribute("name");
		//브라우저 창을 새로 열었을때는 null 값이 나온다 
		//버튼을 한번 실행 시키고  다시 페이지를 생성 시키면 session값이 ITWILL로 나타난다
		String tel = (String)session.getAttribute("tel");
		
		// 만약에 세션 값이 없을 경우 => "세션값 없음~!"출력
	%>
<%-- 	<%if(name == null){
	%>
		<h2>세션값 : 세션값 없음~!</h2>
	<%
	}else{
	%>	
		<h2>세션값 : <%=name%></h2>
	<%	
	}
	%>
	<%if(tel == null){
	%>
		<h2>세션값 : 세션값 없음~!</h2>
	<%
	}else{
	%>	
		<h2>세션값 : <%=tel%></h2>
	<%	
	}
	%> --%>
	
	<%
		if(name == null){
			name="세션값 없음~!";
		}
		if(tel == null){
			tel="세션값 없음~!";
	}
	%>
	<h2>세션값 : <%=name%></h2>
	<h2>세션값 : <%=tel%></h2>
	<input type="button" value="세션값 생성" onclick="location.href='sessionSet.jsp';">
	<input type="button" value="세션값 삭제" onclick="location.href='sessionDel.jsp';">
	<input type="button" value="세션값 초기화" onclick="location.href='sessionInval.jsp';">
</body>
</html>