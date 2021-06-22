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
	
	///////////////////////////////////////////////////////////////////////
	// 페이징 처리
	
	// 한 페이지에 출력할 글의 개수
	int pageSize = 3;
	// 현재 페이지의 위치정보
	// list.jsp로올때 pageNum값을 안가지고 와서 pageNum은 null이다
	// int로 사용하면 인티저로 변환을 계속 해줘야한다
	String pageNum = request.getParameter("pageNum");
	if(pageNum == null){
		pageNum = "1";
	}
	
	// 시작행 계산 1...11...21...31...
	// 계산을 위해 Integer바꿔준다
	int currentPage = Integer.parseInt(pageNum);
	int startRow = (currentPage-1)*pageSize+1;
	//				(1-1)*10+1=1
	//				(2-1)*10+1=11	
	//				(3-1)*10+1=21	
	
	// 끝행 번호 계산 10...20...30...40...
	int endRow = currentPage*pageSize;
	//					   1*10
	//					   2*10
	
	ArrayList boardList = bDAO.getBoardList(startRow, pageSize);
	
	// 저장된 모든 글의 정보를 가져오는 멕서드 생성
// 	ArrayList boardList = bDAO.getBoardList(); 
	
	
	
	///////////////////////////////////////////////////////////////////////
	

	//System.out.println(boardList.toString());
	// .toString() 생략 되어있음
%>	

	<h2> 게시판 목록[총 : <%=cnt%>개]</h2>
	<h3><a href="writeForm.jsp">글쓰기</a></h3>
	<table border="1">
		<tr>
			<td>번호</td>
			<td>이름</td>
			<td>비밀번호</td>
			<td>subject</td>
			<td>content</td>
			<td>조회수</td>
			<td>re_ref</td>
			<td>re_lev</td>
			<td>re_seq</td>
			<td>날짜</td>
			<td>ip</td>
			<td>file</td>
		</tr>
		
<%	
	if(cnt != 0){ // cnt > 0
		// size() : 가변길이 배열의 요소의 수를 리턴하는 메서드
		// 배열 add()로 추가 하고 get()으로 꺼내쓴다
		for(int i =0; i<boardList.size(); i++){
			bb = (BoardBean)boardList.get(i);
%>			
			<tr>
			<td><%=bb.getNum() %></td>
			<td><%=bb.getName() %></td>
			<td><%=bb.getPass() %></td>
			
			<td>
			
			<a href="content.jsp?num=<%=bb.getNum()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
			
			</td>
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
	
	
	<hr>
	
<% 	
	////////////////////////////////////////////////////////////////////////////////
	// 페이징 처리
	if(cnt > 0){
		
		// 한 페이지에서 보여줄 페이지 번호의 개수
		int pageBlock = 2;
		
		// 전체 페이지 갯수  => 전체글 / 페이지 크기
		int pageCount = cnt / pageSize + (cnt % pageSize == 0? 0 : 1);
		
		// 페이지 블럭 시작번호 계산  1 ~ 10 => 1, 11~20 => 11, 21~30 => 21
		int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
		
		// 페이지 블럭 끝번호 계산
		int endPage = startPage + pageBlock -1;
		//    			  1	    +   10     -1 = 10     
		//				  11    +   10     -1 = 20     
		
		if(endPage > pageCount){
			endPage = pageCount;
		}
		
		
		// [이전]
		if(startPage > pageBlock){
			%>
			<a  href="list.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
			<%
		}
		// [1...10] [11...20] [21...30] ...
		for(int i =startPage; i<=endPage; i++){
			%>
				<a href="list.jsp?pageNum=<%=i%>">[<%=i%>]</a>
			<%
		}
		// [다음]
		if(endPage < pageCount){
			%>
			<a  href="list.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
			<%
		}
		
	}
	
	
	
	////////////////////////////////////////////////////////////////////////////////
%>	
</body>
</html>