<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fWritePro</title>
</head>
<body>
	<h1>WebContent/board/fWritePro.jsp</h1>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="bb" class="com.itwillbs.board.BoardBean"/>
<jsp:setProperty property="*" name="bb"/>
	<%
		// 파일 업로드 
		int maxSize = 10*1024*1024;
		
		String realPath = request.getRealPath("/upload");
		
		MultipartRequest multi = 
						new MultipartRequest(
								request,
								realPath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
		
		// 글의 정보를 객체에 저장(BoardBean)
		// - 파일은 파일의 이름만 저장
//		bb.getFile(multi);
		// BoardDAO 객체 생성 글 저장
		// isertBoard()사용
		BoardDAO bDAO = new BoardDAO();
		bDAO.insertBoard(bb);
		// 리스트 페이지로 이동
		
		// 파일 다운로드 (content.jsp)
		
		
		
		
		
		
		
		
		
		
	%>
	
	
</body>
</html>