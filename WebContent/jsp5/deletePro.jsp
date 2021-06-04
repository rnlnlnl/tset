<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>deletePro</title>
</head>
<body>
	<h1>WebContent/jsp5/deletePro.jsp</h1>
	<%
		//한글처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 파라미터값 저장 (delID, delPW)
		String delID = request.getParameter("delID");
		String delPW = request.getParameter("delPW");
		// DB에 연결해서 해당 회원 정보를 확인후 삭제
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		System.out.println("드라이버 로딩 성공");
		
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		System.out.println("디비 연결 성공"+conn);
		
		// select 구문(삭제하려는 사람의 정보가 맞는지 확인후 삭제)
		String sql = "select pass from itwill_member where id = ?";
//		String sql = "delete from itwill_member where id=? && pass=?";

		PreparedStatement pst = conn.prepareStatement(sql);
		System.out.println("오류 입니다!");
		// ?
		pst.setString(1, delID);
		
		// 4)sql실행
		ResultSet rs = pst.executeQuery();
		
		// 5) 데이터 처리 rs.next()가 true일시 회원정보가 있다
		if(rs.next()){
			//회원이다.
			// 본인 여부를 판단 - 비밀번호가 맞는지 체크
			if(delPW.equals(rs.getString("pass"))){
				// 회원 이면서 비밀번호도 동일하다 => 본인 => 수정/삭제 
				// 3) sql 생성 & pstmt 객체
				sql =  "delete from itwill_member where id = ?";
				
				pst = conn.prepareStatement(sql);
				
				pst.setString(1, delID);
				
				// 4) sql 실행
				int result = pst.executeUpdate();
				// -> '0'일때 : sql구문에 영향이 X / 실행오류 / DDL구문
				// sql 구문이 영향을 준 row수를 리턴함 데이터를 지울때마다 숫자가 1이 반환된다
				
				System.out.println("잘가라 넌 자유다!!!!"+result);
				
				
			}else{
				// 회원이지만 ,비밀번호 오류
				System.out.println("비밀번호 오류 입니다!");
				System.out.println("아이디 또는 비밀번호 오류 입니다!");
			}
			
			
		}else{
			//비회원이다.
			System.out.println("비회원입니다.");
		}
		
		
		
		
		
	%>
	
	
	
</body>
</html>