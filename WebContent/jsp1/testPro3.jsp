<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>testPro3</title>
</head>
<body>
	<h1>WebContent/jsp1/testPro3.jsp</h1>
	<%
		// 한글데이터 처리
		request.setCharacterEncoding("UTF-8");
		// 전달정보 저장(파라미터 저장)
	
	%>
	<%
		String name = request.getParameter("name");
		String gender = request.getParameter("gender");
//		String hobby = request.getParameter("hobby");
//		String hobby1 = request.getParameter("hobby");
//		String hobby2 = request.getParameter("hobby");
		
		//String[] arr = new String(4);
		// request.getParameterValues("파라미터명");
		// => String[]리턴 하는 메서드
		String[] hobbyArr =  request.getParameterValues("hobby");
		String subject = request.getParameter("subject");
	%>
		이름 : <%=name %><br>
		성별 : <%=gender %><br>
		
	<%	
		if(hobbyArr != null){
			//hobbyArr 배열의 크기만큼 해당요소 출력
			for(int i =0; i<hobbyArr.length; i++){
				%>
					취미 : <%=hobbyArr[i] %><br>
				<%		
			}
		}
	%>	
		
<%-- 	취미 : <%=hobbyArr[0] %><br>
		취미 : <%=hobbyArr[1] %><br>
		취미 : <%=hobbyArr[2] %><br> --%>
<%-- 	취미 : <%=hobby1 %><br>
		취미 : <%=hobby2 %><br> --%>
		제목 : <%=subject %><br>
	
	
	
	
	
	
	
</body>
</html>