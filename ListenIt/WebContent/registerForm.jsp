<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"
		name="viewprot"
		content="width=divice-width,initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" type="text/css" href="css/style.css" />
<script src="/ListenIt/js/jquery-1.11.3.min.js"></script>
<script>

// 정규식

var BIRTH_DATE_CHECK = /[12][0-9]{3}[01][0-2][0-3][0-9]$/;	//생년월일 체크
var ONLY_ENG_CHECK = /^[a-zA-Z0-9]{1,12}$/;	//영문만 입력가능하도록 체크 1자~12자
var EMAIL_CHECK = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/;	 //이메일 체크
var PWD_CHECK = /^(?=([a-zA-Z]+[0-9]+[a-zA-Z0-9]*|[0-9]+[a-zA-Z]+[a-zA-Z0-9]*)$).{6,12}/; //비밀번호 정규식


function finishRegister(){
	var frm=document.registerForm;

	if($("#pwd").val() != $("#pwdc").val() && $("#pwdc").val().length > 5){
		alert("비밀번호를 올바르게 입력해주세요");
		return;
		}
	
		frm.method="post";
		frm.action="/ListenIt/registerProc.it"; //넘어간화면
		frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
		
	  //alert("회원가입 성공!")
  }
  
$(document).ready(function(){
	$("#id").keyup(function(){
	        if($("#id").val().length > 5) {
	            var id = $(this).val();
	            //alert(id);
	            // ajax 실행
	            $.ajax({
	                type : "POST",
	                url : "/ListenIt/IDCheckProc.it",
	                data:
	                {
	                    id:id
	                    
	                },	                
	                success : function(check) {
	                    console.log(check);
	                    if (check == 0) {
	                        $("#idCheck").html("OK!");
	                    } else if(check == 1) {
	                        $("#idCheck").html("IN USE!");
	                    }
	                },
	                error : function(e){
	                	alert("실패");
	                }
	            }); // end ajax
	        }else if( $("#id").val().length <= 5){
	        	$("#idCheck").html("ID는 최소 6자 이상");
	        }
	    }); // end keyup
	$("#pwdc").keyup(function(){
		if($("#pwd").val() == $("#pwdc").val() && $("#pwd").val().length > 5){
			$("#pwdc_Check").html("OK!");
			return;
		}else if($("#pwd").val() != $("#pwdc").val() && $("#pwdc").val().length > 5){
			$("#pwdc_Check").html("비밀번호가 일치하지 않습니다.");
		}
	});
	$("#pwd").keyup(function(){
		if($("#pwd").val().length > 5){
			$("#pwdCheck").html("OK!");
		}else{
			$("#pwdCheck").html("비밀번호는 최소 6자 이상");
		}
	});
	$("#birth_date").keyup(function(){
		if(BIRTH_DATE_CHECK.test($("#birth_date").val())){
			$("#birthCheck").html("OK!");
		}else if(!BIRTH_DATE_CHECK.test($("#birth_date").val()) && $("#birth_date").val().length == 8 ){
			$("#birthCheck").html("올바른 생년월일을 입력해주세요.");
		}
	});
	$("#email").keyup(function(){
		if(EMAIL_CHECK.test($("#email").val())){
			$("#emailCheck").html("OK!");
		}else if(!EMAIL_CHECK.test($("#email").val()) && $("#email").val().length > 10){
			$("#emailCheck").html("올바른 E-Mail을 입력해주세요.");
		}	
	});
});
</script>
</head>
<body>
<!-- TOP MENU -->  
<jsp:include page="/top_menu.jsp" />
<!-- /TOP MENU -->

<div align="center">
 <form name="registerForm" method="post">

	<table style="border:solid 4px #000000; margin-top:6%">
		<tr>
			<td><input type="text" id="id" name="id" value="" placeholder="아이디" style="height:40px; width:380px;"></td>
			<td id="idCheck" style="width:50px;" align="center"></td>
		</tr>
		</table>
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="password" id="pwd" name="pwd" value=""  placeholder="비밀번호" style="height:40px; width:380px"></td>
			<td id="pwdCheck" style="width:50px;" align="center"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="password" id="pwdc" value=""  placeholder="비밀번호 확인" style="height:40px; width:380px"></td>
			<td id="pwdc_Check" style="width:50px;" align="center"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="text" id="birth_date" name="birth_date" value=""  placeholder="생년월일 ex) '1991년 1월 1일' --> '19910101'" style="height:40px; width:380px"></td>
			<td id="birthCheck" style="width:50px;" align="center"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="text" id="email" name="email" value=""  placeholder="E-Mail" style="height:40px; width:380px"></td>
			<td id="emailCheck" style="width:50px;" align="center"></td>
		</tr>
	</table>

	<table style="margin-top:1%">
	<tr>
		<td><input type="submit" name="register" value="회원가입" style="height:50px; width:400px;  
								background-color:#000000; color:white; font-size:16px; border:solid 1px #000000; " onClick="finishRegister()">
		</td>
	</tr>
	</table>

	<table border="1" style="border:solid 1px #000000; margin-top:2%; width:430px;" >
	</table>
   </form>
  </div>
   	
</body>
</html>