<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>cookiePopup</title>
	<script type="text/javascript">
		//setPopupStart(this); 호출코드
		// this : 이벤트 발생 객체, 선택된 객체
		function setPopupStart(obj) {
			//alert("체크박스 클릭");
			// 쿠키정보를 생성 (시간정보를 저장)
			if (obj.checked == true) {
				var expireDate = new Date();
				expireDate.setMonth(expireDate.getMonth()+1); // 유효기간 1달
				// 쿠키이름 = 쿠키값; path=경로; expires=기간;
				document.cookie = "notShowPop="+"true"+";path=/; expires="+
																expireDate.toGMTString(); //날짜를 String형태로 저장
				
				alert(document.cookie);
				window.close();
			}
			
		}
		
		
	</script>

</head>
<body bgcolor="aqua">
	<h1>WebContent/jsp4/cookiePopup.jsp</h1>
	<h2>ITWILL 광고 이벤트</h2>
	
	<br><br><br><br><br><br>
	<br><br><br><br><br><br>
	
	<input type="checkbox" onclick="setPopupStart(this);"> 오늘 더 이상 팝업창을 띄우지 않기. 
	
</body>
</html>