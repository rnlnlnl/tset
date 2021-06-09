<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<script type="text/javascript">
	function fun1() {
		var id = document.fr.id.value.length;
		var pw = document.fr.pw.value;
		var pw1 = document.fr.pw1.value;
		var name = document.fr.name.value;
		var jumin1 = document.fr.jumin1.value.length; 
		var jumin2 = document.fr.jumin2.value.length;
		var jumin = document.fr.jumin2.value.charAt(0);
		var gen1 = document.fr.gender[0].checked;
		var gen2 = document.fr.gender[1].checked;
		var hobby1 = document.fr.hobby[0].checked;
		var hobby2 = document.fr.hobby[1].checked;
		var hobby3 = document.fr.hobby[2].checked;
		var study = document.fr.study.value;
		var one = document.fr.one.value;
		
		
			if(id == ""){
			alert("아이디를 적어주세요.");
			document.fr.id.focus();
			return false;
		}
		
		if (id < 5 || id > 10) {
			alert("아이디는 5~10자리 입니다.");
			document.fr.id.focus();
			return false;
		}
		
		if (pw == "") {
			alert("비밀번호를 적어주세요.");
			document.fr.pw.focus();
			return false;
		}
		
		if (pw != pw1) {
			alert("비밀번호가 일치하지 않습니다.");
			document.fr.pw1.focus();
			return false;
		}
		
		if (name == "") {
			alert("이름을 적어주세요.");
			document.fr.name.focus();
			return false;
		}
		
		if (jumin1 != 6) {
			alert("주민번호 앞자리는 6자리입니다.");
			document.fr.jumin1.focus();
			return false;
		}
		
		if (jumin2 != 7) {
			alert("주민번호 뒷자리는 7자리입니다.");
			document.fr.jumin2.focus();
			return false;
		} 
		
		if (gen1 == false && gen2 == false) {
			alert("성별을 선택해주세요");
			return false
		}
		
			if (hobby1 == false && hobby2 == false && hobby3 == false) {
			alert("취미를 한개 이상 선택해 주세요.");
			return false;
		}
		
		if (study == "") {
			alert("좋아하는 과목을 선택해주세요.");
			document.fr.study.focus();
			return false;
		}
		
		if (one == "") {
			alert("하고싶은말을 적어주세요.");
			document.fr.one.focus();
			return false;
		} 
		
		
	}

function fun2() {
	var jumin = document.fr.jumin2.value.charAt(0);
	var gender = document.fr.gender.value;
	if(jumin == 1 || jumin == 3){
		document.fr.gender[0].checked=true;
	}
	
	if(jumin == 2 || jumin == 4){
		document.fr.gender[1].click();
	}
}
	
	
	
	
</script>



</head>
<body>
	<h1>회원가입 -김병선</h1>
	<!-- ITWILLJOINPRO.jsp -->
	<fieldset>
		<legend>ITWILL 회원가입</legend>
		<form action="ITWILLJOINPRO.jsp" method="post" name="fr" onsubmit="return fun1();">
			<label>아이디 : </label>
			<input type="text" name="id"><br>
			<label>비밀번호 : </label>
			<input type="password" name="pw"><br>
			<label>비밀번호확인 : </label>
			<input type="password" name="pw1"><br>
			<label>이름 : </label>
			<input type="text" name="name"><br>
			<label>주민번호 : </label> 
			<input type="text" name="jumin1">-
			<input type="text" name="jumin2" onblur="fun2();"><br>
			<label>성별 : </label>
			<input type="radio" name="gender" value="남"> 남 
			<input type="radio" name="gender" value="여"> 여<br>
			<label>취미 : </label>
			<input type="checkbox" name="hobby" value="여행">여행
			<input type="checkbox" name="hobby" value="독서">독서
			<input type="checkbox" name="hobby" value="게임">게임<br>
			<label>좋아하는 과목 : </label>
			<select name="study">
				<option value="">선택하세요</option>
				<option value="JSP">JSP</option>
				<option value="JAVA">JAVA</option>
				<option value="Oracle">Oracle</option>
			</select><br>
			<label>한마디 : </label>
			<textarea name="one" rows="3" cols="10"></textarea>
			
			<hr>
			<input type="submit" value="회원가입">
			<input type="reset" value="처음으로">
		</form>
	</fieldset>
	
	
	
	
</body>
</html>