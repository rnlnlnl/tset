<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>fWriteForm</title>
</head>
<body>
	<h1>WebContent/board/fWriteForm.jsp</h1>
	
	<h2> 파일 업로드 글쓰기 </h2>
	
	<fieldset>
		<form action="fWritePro.jsp" method="post" enctype="multipart/form-data">
		글쓴이 : <input type="text" name="name"><br>
		비밀번호 : <input type="password" name="pass"><br>
		제목 : <input type="text" name="subject"><br>
		첨부파일 : <input type="file" name="file"><br>
		내용 : <br>
		<textarea rows="5" cols="20" name="content"></textarea>
		<hr>
		<input type="submit" value="글쓰기">
		</form>
	</fieldset>
	
	
	
</body>
</html>