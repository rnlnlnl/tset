package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class BoardDAO {
	// DAO (Data Access Object) => itwill_board테이블에 관련된 정보 처리 객체
	
	// 글쓰기 메서드() - insertBoard(bb)
	public void insertBoard(BoardBean bb){
		final String DRIVER="com.mysql.jdbc.Driver";
		final String DBURL="jdbc:mysql://localhost:3306/jspdb";
		final String DBID="root";
		final String DBPW="1234";
		
		int num =0; // 계산된 글 번호 저장
		
		
		try { // 에러가 발생할지도 모르는 구문을 작성 에러가 발생시 catch로 점프한다
			// 1. 드라이버 로드
			Class.forName(DRIVER);
			
			// 2. 디비 연결
			Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
			
			// 3. sql 작성(insert) & pst 객체 생성
			// select max(num) from itwill_board;
			// => rs.next : true
			// => 함수의 결과는 항상 커서가 존재함(데이터 유무와 상관 없음)
			//	  (화살표 모양)
			// select num from itwill_board;
			// => rs.next : false
			// => 함수의 결과가  데이터의 유무에 따라서 커서 유무도 결정
			//	  (원 모양)
			
			// 게시판 번호 계산
			String sql = "select max(num) from itwill_board";
			
			PreparedStatement pst = conn.prepareStatement(sql);
			
			// 4. sql 실행
			ResultSet rs = pst.executeQuery();
			
			// 5.데이터 처리
			if(rs.next()){
				//rs.getInt("max(num)");
				num = rs.getInt(1)+1;
				
				sql = "insert into itwill_board(num,name,pass,subject,content,readcount,"
						+ "re_ref,re_lev,re_seq,date,ip,file) values(?,?,?,?,?,?,?,?,?,now(),?,?)";
																					//현재시간정보
				pst = conn.prepareStatement(sql);
			
				pst.setInt(1, num);
				pst.setString(2, bb.getName());
				pst.setString(3, bb.getPass());
				pst.setString(4, bb.getSubject());
				pst.setString(5, bb.getContent());
				pst.setInt(6, 0); // 조회수 0
				pst.setInt(7, num); // re_ref 답글 그룹번호 / 일반글번호 == 그룹번호
				pst.setInt(8, 0); // re_lev 답글 들여쓰기 / 일반글 들여쓰기 없음(0)
				pst.setInt(9, 0); // re_seq 답글 순서 / 일반글 0
				pst.setString(10, bb.getIp());
				pst.setString(11, bb.getFile());
				
				// 4. sql 실행
				pst.executeUpdate();
				
				System.out.println("DAO : 계시글 작성 완료!");
				
			}
			
			System.out.println("DAO : 글번호 : "+num);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("DAO : 드라이버 로드 실패");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("DAO : DB 연결 실패");
		}
		
	}
	// 글쓰기 메서드() - insertBoard(bb)
	
	
	
	
}
