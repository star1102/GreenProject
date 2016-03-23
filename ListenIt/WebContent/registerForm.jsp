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
  function finishRegister(){
	  var frm=document.registerForm;

		if(frm.id.value.length<3){
			alert("아이디를 올바르게 입력해주세요");
			return;
		}

		if(frm.pwd.value.length<3){
			alert("비밀번호를 올바르게 입력해주세요");
			return;
		}
		if(frm.pwd.value != frm.pwd_c.value){
			alert("비밀번호 확인 값이 다릅니다.")
			return;
		}
		frm.method="post";
		frm.action="/ListenIt/registerProc.it"; //넘어간화면
		frm.submit(); //등록이 될수 있는 조건이면, 정보를 보내겠다.
		
	  //alert("회원가입 성공!")
  }
  
  $(document).ready(function(){
	    $('#id').keyup(function(){
	        if ( $('#id').val().length > 6) {
	            var id = $(this).val();
	            //alert(id);
	            // ajax 실행
	            $.ajax({
	                type : 'POST',
	                url : '/ListenIt/IDCheckProc.it',
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
	        }else if( $('#id').val().length <= 6){
	        	$("idCheck").html("ID는 6자");
	        }
	    }); // end keyup
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
			<td><input type="text" name="id" id="id" value="" placeholder="아이디" style="height:40px; width:380px;"></td>
			<td id="idCheck" style="width:50px;" align="center"></td>
		</tr>
		</table>
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="password" name="pwd" value=""  placeholder="비밀번호" style="height:40px; width:430px"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="password" name="pwd_c" value=""  placeholder="비밀번호 확인" style="height:40px; width:430px"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="text" name="birth_date" value=""  placeholder="생년월일 ex) '1991년 1월 1일' --> '910101'" style="height:40px; width:430px"></td>
		</tr>
	</table>
	
	<table style="border:solid 4px #000000; margin-top:1%">
		<tr>
			<td><input type="text" name="email" value=""  placeholder="E-Mail" style="height:40px; width:430px"></td>
		</tr>
	</table>

	<table style="margin-top:1%">
	<tr>
		<td><input type="submit" name="login" value="회원가입" style="height:50px; width:430px;  
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