
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 위에꺼는 자바 코드이다  자바언어를 사용하며   파일은 html형태로 사용한다      언어는 한글처리를 할수있게 하겠다는 각각의 의미 이다    -->
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>test1</title>
</head>
<body>
	<h1>WebContent/jsp1/test1.jsp</h1>
	
	<h2> JSP는 java와 html 코드를 한번에 사용 </h2>
	
	<!-- html 주석 :브라우저 아무런 영향 X   consol창에서는 보임      -->
	<%-- JSP 주석 : 브라우저 영향가능성이 있음 (내부적으로 무시)  consol창에서도 안보임--%>
	<%
		// java 주석 : 브라우저 영향가능성이 있음 (내부적으로 무시)  consol창에서도 안보임
		/* java 주석 (여러줄) */
	%>
	<h2> 자바개념 정리 </h2>
	<%
		// java 코드를 사용할수있게 하는 태그
		
		// 배열생성 -> "JAVA" "JSP" "HTML" "JAVASCRIPT"  정보 저장
		// => 정보 출력 (콘솔창에 출력)
		String[] st = {"JAVA", "JSP", "HTML", "JAVASCRIPT"};
		
		String[] st1 = new String[]{"JAVA", "JSP", "HTML", "JAVASCRIPT"};
		
		//String[] arr4[]; 가독성이 떨어짐  
		//int arr[3];(x) c언어에서 이렇게 표시
		
		String[] arr = new String[4];
		arr[0] = "JAVA";
		arr[1] = "JSP";
		arr[2] = "HTML";
		arr[3] = "JAVASCRIPT";
		
		for(int i=0; i<arr.length; i++){
			System.out.println(arr[i]);//콘솔에 출력이 됨
		}
		
		for(int i=0; i<arr.length; i++){
			//화면에 출력이됨
			//java코드 사용해서 html화면에 출력
			//out.print(html 코드);
			out.println("<h2>"+arr[i]+"</h2>"); 
		}
		
		
		for(int i=0; i<arr.length; i++){
			%>
			HTML코드 : <%=arr[i]%><br>
			
			<%
		}
		// %태그로 만들어진 코드는 연결되어있음
		// 톰켓이 자동으로 파일을 바꿔준다 이것을 서블릿?
	%>
	
	
	
	<hr>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
		</tr>
		<% 
		for(int i =0; i<arr.length; i++){
		%>
		<tr>
			<td><%=i+1%></td>
			<td><%=arr[i] %></td>
		</tr>
		<% 
		}
		%>
	</table>
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>