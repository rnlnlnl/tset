<%@page import="java.util.List"%>
<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>list</title>
</head>
<body>
	<h1>WebContent/board/list.jsp</h1>

<%
	// 테이블에 저장된 글의 총개수 확인
	// BoardDAO 객체 생성
	BoardDAO bDAO = new BoardDAO();
	BoardBean bb = new BoardBean();
	// 글의 총개수를 계산하는 매서드 생성
	int cnt = bDAO.getBoardCount();
	
	// 저장된 모든 글의 정보를 가져오는 멕서드 생성
 	ArrayList boardList = bDAO.getBoardList(); 
%>	

	<h2> 게시판 목록[총 : <%=cnt%>개]</h2>
	<table border="1">
		<tr>
			<td>num</td>
			<td>name</td>
			<td>pass</td>
			<td>subject</td>
			<td>content</td>
			<td>readcount</td>
			<td>re_ref</td>
			<td>re_lev</td>
			<td>re_seq</td>
			<td>date</td>
			<td>ip</td>
			<td>file</td>
		</tr>
		
<%	
	if(cnt != 0){ // cnt > 0
		for(int i =0; i<boardList.size(); i++){
			bb = (BoardBean)boardList.get(i);
%>			
			<tr>
			<td><%=bb.getNum() %></td>
			<td><%=bb.getName() %></td>
			<td><%=bb.getPass() %></td>
			<td><%=bb.getSubject() %></td>
			<td><%=bb.getContent() %></td>
			<td><%=bb.getReadcount() %></td>
			<td><%=bb.getRe_ref() %></td>
			<td><%=bb.getRe_lev() %></td>
			<td><%=bb.getRe_seq() %></td>
			<td><%=bb.getDate() %></td>
			<td><%=bb.getIp() %></td>
			<td><%=bb.getFile() %></td>
			</tr>
<%			
		}
	} 
%>
		
	</table>
	<a href="writeForm.jsp">글쓰기</a>
	
	
	
	
</body>
</html>