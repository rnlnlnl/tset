<%@page import="com.itwillbs.beantest.JavaBean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>beanPro2</title>
</head>
<body>
	<h1>WebContent/javabean/beanPro2.jsp</h1>
<% 	
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String pass = request.getParameter("pass");
	int age = Integer.parseInt(request.getParameter("age"));
	String tel = request.getParameter("tel");
%>	
	아이디 : <%=id%><br>
	비밀번호 : <%=pass%><br>
	나이 : <%=age%><br>
	전화번호 : <%=tel%><br>
	<%
	///////////////////////////////////////////////////////////////////
	// 아이디 , 비밀번호, 나이 ,전화번호 정보를 저장하는 JavaBean2 객체 생성
	
	// 전달된 4개의 정보를 JavaBean2 객체를 생성후 저장
	// 정보 출력
	
	JavaBean2 bean2 = new JavaBean2();
	
	bean2.setId(id);
	bean2.setPass(pass);
	bean2.setAge(age);
	//bean2.setTel(tel);
	bean2.setTel(request.getParameter("tel"));
	
	%>
	
	<%=bean2 %><br>
	<%=bean2.getId() %>
	
	<h2> 액션태그 </h2>
	<!-- 객체 생성 -->
	<%-- <jsp:useBean  id="객체 이름" class="객체 파일 위치"/> --%>
	<jsp:useBean  id="jb3" class="com.itwillbs.beantest.JavaBean2"/>
	 
	<!-- 정보 저장(액션태그)  -->
	<%-- <jsp:useBean property="자바빈객체 변수명"  name="객체 이름" param="파라미터값"/> --%>
	<%-- property와param 속성이 동일할경우 param생략가능 --%>
	<!-- 전달되는 모든 파라미터와 저장되는 모든 프러퍼티가 동일 할경우 -->
	
	<%
		//jb3.setAge(age) + request.getParameter(arg0)
		// 위 두개의 동작을 결합한 형태로 실행
		// => 이때 자동으로 타입에 맞는 처리 실행
	%>
	
	<jsp:setProperty property="*" name="jb3" />
	
<%-- 	<jsp:setProperty property="id" name="jb3" param="id"/>
	<jsp:setProperty property="pass" name="jb3" param="pass"/>
	<jsp:setProperty property="age" name="jb3" param="age"/>
	<jsp:setProperty property="tel" name="jb3" param="tel"/> --%>
	<!-- 정보 출력(액션태그) -->
	<jsp:getProperty property="id" name="jb3"/><br>
	<jsp:getProperty property="pass" name="jb3"/><br>
	<jsp:getProperty property="age" name="jb3"/><br>
	<jsp:getProperty property="tel" name="jb3"/><br>
</body>
</html>