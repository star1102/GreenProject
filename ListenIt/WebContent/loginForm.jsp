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
<script src="/ListenIt/js/jquery-1.11.3.min.js"></script>
<script>

function login(){

	var frm = document.loginform;
	
	$.ajax({
        type : "POST",
        url : "/ListenIt/loginProc.it",
        data:
        {
        	id : frm.id.value 
        	, pwd : frm.pwd.value
        	},
        success : function(check) {
            console.log(check);
            
            if(check == 0){
            	alert("아이디 또는 비밀번호를 다시 확인하세요.")
            	return;
            }else if(check == 1){
            	frm.method="post";
            	frm.action="/ListenIt/index.it"; //넘어간화면
            	frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
            }
        },
        error : function(e){
        	alert("ERROR : 고객센터로 문의 부탁드립니다.");
        }
    });
}
	
</script>
</head>

<body>
<!-- TOP MENU -->  
<jsp:include page="/top_menu.jsp" />
<!-- /TOP MENU -->
<div align="center">
 <form name="loginform" method="post">

	<table style="border:solid 4px #000000; margin-top:6%">
		<tr>
			<td><input type="text" name="id" value="" placeholder="아이디" style="height:40px; width:430px;"></td>
		</tr>
		</table>
	<table style="border:solid 4px #000000; margin-top:1%">
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

	<table  border="1" style="width : 440px; border:solid 1px #000000; margin-top:2%">
	</table>

	<table style="margin-top:1%" class="mo">
		<tr>
			<td><a style="text-decoration:none; color:black;" href="">아이디 찾기 | </a></td>
			<td><a style="text-decoration:none; color:black;" href="">비밀번호 찾기 </a></td>
		</tr>
		
	</table>
   </form>
  </div>
   	
</body>
</html>