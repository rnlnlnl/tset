<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro</title>
</head>
<body>
	<h1>WebContent/board/deletePro.jsp</h1>
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 파라미터값 저장
		int num = Integer.parseInt(request.getParameter("num"));
		String pageNum = request.getParameter("pageNum");
		String pass = request.getParameter("pass");
		// DAO객체 생성 -> 글 삭제 메서드 (deleteBoard())
		BoardDAO bDAO = new BoardDAO(); 
		int check = bDAO.deleteBoard(pass,num);
		
		// => 0,-1,1 값을 사용하여 페이지 이동(JS)
		if(check == 1){
			%>
			<script type="text/javascript">
				alert("삭제완료");
				location.href="list.jsp";
			</script>
			<%
		}else if(check == 0){
			%>
			<script type="text/javascript">
				alert("비밀번호 틀림");
				history.back();
			</script>
			<%
		}else{
			%>
			<script type="text/javascript">
				alert("글 없음");
				history.back();
			</script>
			<%
		}
		
				
				
				
				
	%>
	
	
	
	
</body>
</html>