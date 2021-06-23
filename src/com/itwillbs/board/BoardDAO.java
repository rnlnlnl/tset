package com.itwillbs.board;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO {
	// DAO (Data Access Object) => itwill_board테이블에 관련된 정보 처리 객체
	
	Connection conn = null;
	PreparedStatement pst = null;
	ResultSet rs = null;
	String sql ="";
	
	
	
	// DB연결 메서드 - 커넥션풀 사용
	// => 디비 연결정보 (Connection)를 미리 생성 해서 pool에다가 저장
	// 사용시 연결정보 대여, 사용후 반납처리 (기본 처리로직은 대기 -> 생성후 반납)
	
	// 1. 라이브러리 설치 (프로젝트당 한번씩)
	// 2. context.xml 파일 생성(디비 연결 정보)
	// 3. 파일을 호출해서 디비 연결 
	
	private Connection getCon() throws Exception{
		// initCTX 초기화라는뜻
		// 업캐스팅
		// java:comp/env/ 고정으로 적어줘야 한다
		// 프로젝트 정보를 초기화
		Context initCTX = new InitialContext(); 
		
		// 다운 캐스팅 lookup이 Object라서 그럼
		// ds 가 DriverManager을 대신한다
		// 프로젝트에있는 DB연결정보(이름)를 불러온다
		DataSource ds 
			= (DataSource)initCTX.lookup("java:comp/env/jdbc/mysqlDB");
		
		// 디비 연결
		conn = ds.getConnection();
		System.out.println("DAO : DB연결 성공! "+conn);
		
		return conn;
	}
	
	// 자원해제
	public void closeDB(){
		try {
			if(rs != null)rs.close();
			if(pst != null)pst.close();
			if(conn != null)conn.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	
	
	
	// 글쓰기 메서드() - insertBoard(bb)
	public void insertBoard(BoardBean bb){
//		final String DRIVER="com.mysql.jdbc.Driver";
//		final String DBURL="jdbc:mysql://localhost:3306/jspdb";
//		final String DBID="root";
//		final String DBPW="1234";
		
		int num =0; // 계산된 글 번호 저장
		
		
		try { // 에러가 발생할지도 모르는 구문을 작성 에러가 발생시 catch로 점프한다
			// 1. 드라이버 로드
//			Class.forName(DRIVER);
			
			// 2. 디비 연결
//			Connection conn = DriverManager.getConnection(DBURL, DBID, DBPW);
			
	//		1,2 디비연결(CP)
			Connection conn = getCon();
			
			
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
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("DAO : DB 연결 실패");
		}finally{
			closeDB();
		}
		
	}
	// 글쓰기 메서드() - insertBoard(bb)
	
	// getBoardCount()------------------------------------------------------------------
	public int getBoardCount(){
		
		int cnt= 0; 
		
		// 1.2 DB 연결
		try {

			conn = getCon();
			
			// 3. sql 작성 & pst 객체 생성
			// 글의 총개수 계산
			sql = "select count(num) from itwill_board";
			
			pst = conn.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pst.executeQuery();
			
			// 5. 데이터 처리
			if(rs.next()){
				cnt = rs.getInt(1);
				//cnt = rs.getInt("count(num)");
			}
			
			System.out.println("DAO : 글개수 확인"+cnt);
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			closeDB();
		}
		return cnt;
	}
	// getBoardCount()------------------------------------------------------------------
	
	// getBoardList()------------------------------------------------------------------
	// <> java에서는 다이아몬드 오퍼레이터라고 불린다
	public ArrayList getBoardList(){
		// ArrayList : 가변 길이 배열(자동으로 배열의 크기를 지정)
		
		ArrayList boardList = new ArrayList();
		
		// 1.2 DB연결
		try {
			conn = getCon();
		
			// 3. sql 작성 & pst 객체
			sql = "select * from itwill_board";
			pst = conn.prepareStatement(sql);
			
			// 4. sql 실행
			rs = pst.executeQuery();
			
			// 5. 데이터 터리
			while(rs.next()){
				// 글1개의 정보를 저장
				BoardBean bb = new BoardBean();
				bb.setContent(rs.getString("content"));
				bb.setDate(rs.getDate("date"));
				bb.setFile(rs.getString("file"));
				bb.setIp(rs.getString("ip"));
				bb.setName(rs.getString("name"));
				bb.setNum(rs.getInt("num"));
				bb.setPass(rs.getString("pass"));
				bb.setRe_lev(rs.getInt("re_lev"));
				bb.setRe_ref(rs.getInt("re_ref"));
				bb.setRe_seq(rs.getInt("re_seq"));
				bb.setReadcount(rs.getInt("readcount"));
				bb.setSubject(rs.getString("subject"));
				// 글정보를 배열 1칸에 저장
				boardList.add(bb);
			}
			
			System.out.println("DAO : 글목록 저장완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	// getBoardList()------------------------------------------------------------------
	
	// getBoardList(startRow,pageSize)
	public ArrayList getBoardList(int startRow,int pageSize){
		
		ArrayList boardList = new ArrayList();
		
		try {
		// 1.2디비 연결
		conn = getCon();
		// 3. sql 작성 & pst 객체
		// re_ref 내림차순 정렬, re_seq 오름차순
		// limit 시작행 -1, 갯수 => 원하는 갯수만큼 잘라서 처리
		sql = "select * from itwill_board order by re_ref desc, re_seq asc limit ?,?";
		
		pst =  conn.prepareStatement(sql);
		pst.setInt(1, startRow-1);
		pst.setInt(2, pageSize);
		// 4. sql 실행
		rs = pst.executeQuery();
		
		// 5. 데이터 처리
		while (rs.next()) {
			BoardBean bb = new BoardBean();
			bb.setContent(rs.getString("content"));
			bb.setDate(rs.getDate("date"));
			bb.setFile(rs.getString("file"));
			bb.setIp(rs.getString("ip"));
			bb.setName(rs.getString("name"));
			bb.setNum(rs.getInt("num"));
			bb.setPass(rs.getString("pass"));
			bb.setRe_lev(rs.getInt("re_lev"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setSubject(rs.getString("subject"));
			// 글정보를 배열 1칸에 저장
			boardList.add(bb);
			
			}
			
			System.out.println("DAO : 게시판글저장완료 (페이징 처리)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return boardList;
	}
	// getBoardList(startRow,pageSize)
	
	
	//updateReadcount(num)
	public void updateReadcount(int num){
		
		try {
			// 1,2DB연결
			conn = getCon();
			// 3.sql (기존의 조회수 +1) & 객체 생성
			sql = "update itwill_board set readcount = readcount+1 where num = ? ";
			// 4. sql 실행
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			pst.executeUpdate();
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//updateReadcount(num)
	
	
	//getBoard(num)
	public BoardBean getBoard(int num){
		BoardBean bb = null;
		try{
		// 1.2디비 연결
		conn = getCon();
		// 3. sql (num에 해당하는 모든 글의 정보 가져오기) & pst 생성
		sql = "select * from itwill_board where num = ?";
		// 4. sql 실행
		pst = conn.prepareStatement(sql);
		pst.setInt(1, num);
		
		rs = pst.executeQuery();
		// 5. 데이터 처리
		if(rs.next()){
			// 데이터 있을때만 객체 생성 (데이터 저장공간 아낌)
			bb = new BoardBean();
			
			bb.setContent(rs.getString("content"));
			bb.setDate(rs.getDate("date"));
			bb.setFile(rs.getString("file"));
			bb.setIp(rs.getString("ip"));
			bb.setName(rs.getString("name"));
			bb.setNum(rs.getInt("num"));
			bb.setPass(rs.getString("pass"));
			bb.setRe_lev(rs.getInt("re_lev"));
			bb.setRe_ref(rs.getInt("re_ref"));
			bb.setRe_seq(rs.getInt("re_seq"));
			bb.setReadcount(rs.getInt("readcount"));
			bb.setSubject(rs.getString("subject"));
			
		}
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bb;
	}
	//getBoard(num)
	
	
	//updateBoard(bb)
	public int updateBoard(BoardBean bb){
		
		int check = -1;
		
		try{
		// 1.2 디비연결
		conn = getCon();
		// 3. sql 작성(글이 있는지 판단후 글 수정) & pst 객채
		sql = "select pass from itwill_board where num = ?";
		// 4. sql 실행
		pst = conn.prepareStatement(sql);
		
		pst.setInt(1, bb.getNum());
		rs = pst.executeQuery();
		// 5. 데이터 처리
		if(rs.next()){// 데이터 있을때
			if(bb.getPass().equals(rs.getString("pass"))){
				// 3. sql (데이터 수정) & pst 객체
				sql = "update itwill_board set name = ?, subject = ?, content = ? where num = ?";
				
				// 4. sql 실행
				pst = conn.prepareStatement(sql);
				
				pst.setString(1, bb.getName());
				pst.setString(2, bb.getSubject());
				pst.setString(3, bb.getContent());
				pst.setInt(4, bb.getNum());
				
				pst.executeUpdate();
				
				check = 1;
				System.out.println("DAO : 회원정보 수정완료!");
			}else{
				//비밀번호 오류(본인 X)
				check = 0;
			}
		}else{
			// 데이터가 없을때 (글 정보가 X)
			check = -1;
		}
		
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	//updateBoard(bb)
	
	//deleteBoard(num,pass)
	public int deleteBoard(String pass, int num){
		int check =0;
		
		try {
			// 1.2 DB연결
			conn = getCon();
			// 3. sql작성(select) & pst 객체
			sql = "select pass from itwill_board where num = ?";
			
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, num);
			// 4. sql 실행
			rs = pst.executeQuery();
			// 5. 데이터 처리
			if(rs.next()){
				if(pass.equals(rs.getString("pass"))){
					// 3. sql (delete)
					sql = "delete from itwill_board where num=?";
					
					pst = conn.prepareStatement(sql);
					
					pst.setInt(1, num);
					// 4. sql 실행
					pst.executeUpdate();
					
					System.out.println("DAO: 글 삭제 완료!");
					check = 1;
				}else{
					check = 0;
				}
			}else{
				check = -1;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
		return check;
	}
	//deleteBoard(num,pass)
	
	
	//reInsertBoard(bb)
	public void reInsertBoard(BoardBean bb){
		int num = 0;
		
		try {
			conn = getCon();
			///////////////////////////////////////////////////////
			// 글번호 계산
			sql = "select max(num) from itwill_board";
			pst = conn.prepareStatement(sql);
			
			rs = pst.executeQuery();
			
			if(rs.next()){
				num = rs.getInt(1)+1;
			}
			System.out.println("DAO : 답글 번호 계산"+num);
			///////////////////////////////////////////////////////
			// 답글 순서 재배치 (update)
			// re_ref 같은 그룹에 있으면서, 기존의 re_seq 값보다 큰값이 있을때
			// re_seq값을 1증가
			
			sql = "update itwill_board set re_seq = re_seq + 1 "
					+"where re_ref=? and re_seq>?";
			pst = conn.prepareStatement(sql);
			
			pst.setInt(1, bb.getRe_ref());
			pst.setInt(2, bb.getRe_seq());
			
			pst.executeUpdate();
			
			///////////////////////////////////////////////////////
			// 답글을 저장 (insert)
			
			sql = "insert into itwill_board values(?,?,?,?,?,?,?,?,?,now(),?,?)";
			
			pst = conn.prepareStatement(sql);
			pst.setInt(1, num);
			pst.setString(2, bb.getName());
			pst.setString(3, bb.getPass());
			pst.setString(4, bb.getSubject());
			pst.setString(5, bb.getContent());
			pst.setInt(6, bb.getReadcount());
			pst.setInt(7, bb.getRe_ref());   // re_ref() : 원글의 그룹번호와 동일
			pst.setInt(8, bb.getRe_lev()+1); // re_lev() : 원글의 들여쓰기 +1
			pst.setInt(9, bb.getRe_seq()+1); // re_seq() : 순서대로 기존의 값 +1
			pst.setString(10, bb.getIp());
			pst.setString(11, bb.getFile());
			
			pst.executeUpdate();
			
			System.out.println("DAO : 답글 작성 완료!!");
			
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			closeDB();
		}
	}
	//reInsertBoard(bb)
	
	
	
	
	
	
	
}
