<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>select</title>
</head>
<body>
	
	<%
		// 회원의 정보를 출력(개인 1명 정보 조회 )
		String id = "itwill";
		String pw = "444444444";
		
		// 디비 연결 정보
		final String DRIVER ="com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		// 1) 드라이버 로드
		Class.forName(DRIVER);
		
		System.out.println("드라이버 로드 성공!");
		
		// 2) 디비 연결
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		System.out.println("디비 연결 성공!");
		
		// 3) sql 쿼리 & pstmt 객체
//		String sql = "select * from itwill_member where id = ? and pass=?";
//		String sql = "select * from itwill_member where id != 'admin'";
		String sql = "select * from itwill_member";
		
		PreparedStatement pstmt = conn.prepareStatement(sql);
//		pstmt.setString(1, id);
//		pstmt.setString(2, pw);
		
		// 4) sql 실행
		ResultSet rs = pstmt.executeQuery();
		
		// 커서=> 	  B  O  F (Begin Of File)
		//			----------------------------
		// 			  DB 데이터 (selectans rufrhk)
		//			----------------------------
		// 		 	  E  O  F (End Of File)
		
		// select문의 결과를 '레코드셋' 이라 하는데 해당 데이터는 
		// java.sql.ResultSet 타입으로 사용 가능하다.
		
		// 5) 데이터 처리
//		if(rs.next()){ //커서를 다음으로 이동시킬때, 데이터가 있으면 true, 데이터가 없으면(EOF) false
			
//			 out.print("아이디 : "+rs.getString("id")+"<br>");
//			 out.print("비밀번호 : "+rs.getString("pass")+"<br>");
//			 out.print("이메일 : "+rs.getString("email")+"<br>");
			
			 // rs.getXXXX("컬럼명"); : select문의 결과 중에서 "컬럼명"에 해당하는 값 가져오기
			 // XXXX 는 DB데이터의 타입에 따라서 변경
			 // rs.getXXXX(컬럼인덱스번호) :  ""  인덱스 번호에 해당하는 값 가져오기
			 // -> 컬럼의 인덱스 번호는 1번부터 시작(왼 -> 오) 훨신 처리속도가 빠름
//			 out.print("아이디 : "+rs.getString(1)+"<br>");
//			 out.print("비밀번호 : "+rs.getString(2)+"<br>");
//			 out.print("이메일 : "+rs.getString(6)+"<br>");
//		}

		System.out.println("회원정보 조회 성공!! (select)");
		
		// select 구문을 사용해서 DB에 있는 모든 회원의 정보를 출력
		
		// for(배열을 쓴거와 같다)
			while(rs.next()){
				if(rs.getString("id").equals("admin")){
					//System.out.print("관리자 있음");
					//관리자 출력 X ,그외 사람의 정보를 출력
					continue;
				}
					
					out.print("아이디 : "+rs.getString(1)+"<br>");
					out.print("비밀번호 : "+rs.getString(2)+"<br>");
					out.print("이메일 : "+rs.getString(6)+"<br>");
			}

	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>