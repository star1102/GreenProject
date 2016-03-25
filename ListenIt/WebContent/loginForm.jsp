<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"
		name="viewprot"
		content="width=divice-width,initial-scale=1.0">
<title>로그인</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script>

  function login(){

	var frm=document.loginform;

	if(frm.id.value.length<3){
		alert("아이디를 올바르게 입력해주세요");
		return;
	}

	if(frm.pwd.value.length<3){
		alert("비밀번호를 올바르게 입력해주세요");
		return;
	}
	
	
	frm.method="post";
	frm.action="/ListenIt/loginProc.it"; //넘어간화면
	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
	}
</script>
</head>
<body>
<!-- TOP MENU -->  
<jsp:include page="/top_menu.jsp" />
<!-- /TOP MENU -->

<div align="center">
 <form name="loginform" method="post">

	<table align="center" height="40" width="430" border="0" style="border:solid 4px #000000; margin-top:6%">
		<tr>
			<td><input type="text" name="id" value="" placeholder="아이디" style="height:40px; width:430px;"></td>
		</tr>
		</table>
	<table align="center" height="40" width="430" border="0" style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="password" name="pwd" value=""  placeholder="비밀번호" style="height:40px; width:430px"></td>
		</tr>
	</table>

	<table style="margin-top:1%">
	<tr>
		<td><input type="button" value="로그인" 
		style = "height:50px; width:430px; background-color:#000000; color:white; font-size:16px; border:solid 1px #000000;"
		 onclick = "login();"></td>
	</tr>
	</table>

	<table align="center" height="0" width="440" border="1" style="border:solid 1px #000000; margin-top:2%">
	</table>

	<table align="center" height="50" style="margin-top:1%" class="mo">
		<tr>
			<td><a style="text-decoration:none; color:black;" href="/ListenIt/registerForm.it">회원가입 | </a></td>
			<td><a style="text-decoration:none; color:black;" href="">아이디 찾기 | </a></td>
			<td><a style="text-decoration:none; color:black;" href="">비밀번호 찾기 </a></td>
		</tr>
		
	</table>
   </form>
  </div>
   	
</body>
</html>