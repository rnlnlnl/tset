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
	<h1>WebContent/member/deletePro.jsp</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
		// 모든 클래스는 항상 Object를 상속						***참조형 타입 형변환 
		//												상속이 반드시 필요
		// => 모든 클래스는 Object로 형변환이 가능하다(업 캐스팅)		업 캐스팅 : 서브클래스가 슈퍼클래스타입으로 형변환
		//      										슈퍼클래스의 레퍼런스에 서브클래스의 객체의 저장
		//												부모 클래스의 참조변수에 자식 클래스의 인스턴스의 저장
		// 												(=> 자동 형변환)
		// => 모든 서브 클래스는 부모클래스로 형변환이 가능하다(업 캐스팅)  다운 캐스팅 : 슈퍼 클래스가 서브클래스로 형변환
		// 												(=> 강제 형변환)
		//												기본적으로 다운 캐스팅은 자동 형변환 X (컴파일에러)=> 명시적 형변환
		//												실행시 메모리에 정보가 없으면 객체를 사용X (실행시 예외)
		//												=> 존재하지 않을수 있는 영역을 참고할수 없음.
		// Child c2 = p2; 컴파일 에러는 - 컴파일 러는 실행전에 객체 메모리(상속관계 확인 어려움)
		// Child c2 = (Child)p2;
		String id = (String)session.getAttribute("id");
		
		String pass = request.getParameter("pass");
		
		final String DRIVER = "com.mysql.jdbc.Driver";
		final String DBURI = "jdbc:mysql://localhost:3306/jspdb";
		final String DBID = "root";
		final String DBPW = "1234";
		
		Class.forName(DRIVER);
		
		Connection conn = DriverManager.getConnection(DBURI, DBID, DBPW);
		
		String sql = "select * from itwill_member where id = ?"; 
		
		PreparedStatement pst = conn.prepareStatement(sql);
		
		pst.setString(1, id);
		
		ResultSet rs = pst.executeQuery();
		
		if(rs.next()){
			if(pass.equals(rs.getString("pass"))){
				sql = "delete from itwill_member where id = ?";
				
				pst = conn.prepareStatement(sql);
				
				pst.setString(1, id);
				
				pst.executeUpdate();
				// 세션정보 삭제 (로그인 정보)
				session.invalidate();
				%>
					<script type="text/javascript">
						alert("삭제되었습니다");
						location.href="main.jsp";
					</script>
				<%
				
			}else{
				%>
					<script type="text/javascript">
					alert("비밀번호가 틀렸습니다.");
					history.back();
					</script>
				<%
			}

		}
		
	%>

	
</body>
</html>