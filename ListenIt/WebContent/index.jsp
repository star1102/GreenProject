<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE htm>
<html>
<head>

<title> 리슨잇 </title>
	<meta charset="UTF-8"
		name="viewprot"
		content="width=divice-width,initial-scale=1.0">
		
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

function getCheckBox() {
	var leng = list.rows.length;
	for(i=0; i<leng / 2; i++){
		var check = document.getElementById("check"+i);
		var editButton = document.getElementById("editButton");
		if(check.style.display == "none"){
			check.style.display="";
			editButton.value="편집 취소";
		}else{
			check.style.display="none";
			editButton.value="편집";
		}
	}
	for(l=0; l<4; l++){
		var hidden = document.getElementById("hidden"+l);
		if(hidden.style.display == "none"){
			hidden.style.display="";
		}else{
			hidden.style.display="none";
		}
	}
}

function checkANDclear(){
	var count = list.rows.length / 2;
	var captain = document.getElementById("check_0");
	if(captain.checked == false){
		for(i=1; i<count; i++){
			var check = document.getElementById("check_"+i);
			check.checked=false;
		}
	}
	if(captain.checked == true){
		for(i=1; i<count; i++){
			var check = document.getElementById("check_"+i);
			check.checked=true;
		}
	}
}

function checkReverse(){
	var count = list.rows.length / 2;
	var captain = document.getElementById("check_0");
	for(i=1; i<count; i++){
		var check = document.getElementById("check_"+i);
		if(check.checked == false){
			check.checked=true;
		}else{
			captain.checked=false;
			check.checked=false;
		}
	}
}

</script>

<script type="text/javascript">
	
var timeout    = 500;
var closetimer = 0;
var ddmenuitem = 0;

function dropdown_open()
{  dropdown_canceltimer();
   dropdown_close();
   ddmenuitem = $(this).find('ul').css('visibility', 'visible');}

function dropdown_close()
{  if(ddmenuitem) ddmenuitem.css('visibility', 'hidden');}

function dropdown_timer()
{  closetimer = window.setTimeout(dropdown_close, timeout);}

function dropdown_canceltimer()
{  if(closetimer)
   {  window.clearTimeout(closetimer);
      closetimer = null;}}

$(document).ready(function()
{  $('#dropdown > li').bind('mouseover', dropdown_open)
   $('#dropdown > li').bind('mouseout',  dropdown_timer)});

document.onclick = dropdown_close;
</script>

</head>

<body>
<!-- TOP MENU -->  
 <div class="header">
	<div id="top_navi">
	   <ul>
	   		<li><a href="/ListenIt/index.it">HOME</a></li>
			<li><a href="/ListenIt/loginForm.it">LOGIN</a></li>
			<li><a href="/ListenIt/registerForm.it">SING UP</a></li>
			<li><a href="/ListenIt/memberList.it">회원 관리</a></li>
		</ul>
	</div><!-- navi -->
<br>

	<header>
	<br>
	<div id="search">
	<form>
		<input name="input" type="text" class="main_input">
		<input name="search" type="button" value="검색" class="btn1">
	</form>
    </div>
  </header>
  
<!--   
	<table>
		<tr>
			<td>
			<span id="logo">
		    <a href="xmlParse.jsp"><img src="img/title.jpg" width="200" height="108" alt="logo" /></a>
	    	</span>  //logo 
	    	</td>
    		<td style = "padding-left:500px;">
    		<form name="loginform">
    		<table>	
			    <tr><td><input type="text" name="id" value="" placeholder="아이디" style="height:20px; width:160px;"></td></tr>
			    <tr><td><input type="password" name="pwd" value=""  placeholder="비밀번호" style="height:20px; width:160px"></td></tr>
			    <tr><td><input type="button" value="로그인" 
				style = "height:30px; width:160px; background-color:#000000; color:white; font-size:16px; border:solid 1px #000000;"
				 onclick = "login();"></td></tr>
			</table>
			</form>
			</td>
		</tr>
	</table> -->

	<div>
	<nav>
  	<ul id="dropdown">
				<li><a href="#">음악차트</a>
				<ul>
					<li><a href="#">TOP100</a></li>
					<li><a href="#">장르별차트</a></li>
				</ul>
				</li>
				
				<li><a href="#">최신음악</a></li>
				
				<li><a href="#">장르별음악</a>
				<ul>
					<li><a href="#">가요</a></li>
					<li><a href="#">POP</a></li>
					<li><a href="#">OST</a></li>
					<li><a href="#">JPOP</a></li>
					<li><a href="#">JAZZ</a></li>
					<li><a href="#">CLASSIC</a></li>
					<li><a href="#">EDM</a></li>
					<li><a href="#">CCM</a></li>
				</ul>
				</li>
				
				<li><a href="#">자작곡</a>
				<ul>
					<li><a href="#">자작곡 게시판</a></li>
					<li><a href="#">TOP100</a></li>
				</ul>
				</li>
				
				<li><a href="#">고객지원</a>
				<ul>
					<li><a href="#">공지사항</a></li>
					<li><a href="#">QNA</a></li>
					<li><a href="#">FAQ</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
				</li>
	</ul>				
  	</nav>
	</div>
  </div>
<br>
<!-- /TOP MENU -->
    
<div id="content">	
	<div id="list_t">
  	<div class="header">
		  		<input type="button" value="편집" id="editButton" onclick="getCheckBox();">
				<input type="button" value="선택듣기" id="hidden0" style="display:none;">
				<input type="button" value="선택다운" id="hidden1" style="display:none;">
				<input type="button" value="선택반전" id="hidden2" style="display:none;" onclick="checkReverse();" >
				<input type="button" value="선택삭제" id="hidden3" style="display:none;">
				<a onclick="window.open('/ListenIt/uploadForm.it','','scrollbars=no, width=600,height=600,left=400,top=90');return false">
				<input type="button" value="올리기">
				</a>
	</div>
		<table class="header" id="list">
			<tr class="song_list">
				<td width="5" id="check0" style="display:none;"><input type="checkbox" id="check_0" onclick="checkANDclear();"></td>
				<td width="5%" >번호</td>
				<td width="70%" >곡정보</td>
				<td width="10%" >듣기</td>
				<td width="10%" >다운</td>
			</tr>
			<tr class="song_emp_list">
					<td colspan="5"></td>
			</tr>
			<c:if test = "${ total == 0 }">
				<tr>
					<td colspan="5" align="center">등록된 글이 없습니다.</td>
				</tr>
				<tr class="song_emp_list">
					<td colspan="5"></td>				
				</tr>
			</c:if>
			<% 
			int i=0;
			%>
			<c:forEach var="bean" items="${ requestScope.list }">
			<tr class="song_list">
				<td width="5" id="check<%= ++i %>" style="display:none;"><input type="checkbox" id="check_<%=i%>"></td>
				<td width="5%" ><c:out value="${bean.getId()}"/></td>
				<td width="70%" ><c:out value="${bean.getSinger_name()}"/> - <c:out value="${bean.getSong_name()}"/></td>
				<td width="10%" ><a href="#" >듣기</a></td>
				<td width="10%" ><a href="/ListenIt/download.it?
											file_name=${bean.getFile_name()}&
											singer_name=${bean.getSinger_name()}&
											song_name=${bean.getSong_name()}" >
											다운</a></td>
			</tr>
			<tr class="song_emp_list">
				<td colspan="5"></td>				
			</tr>
			</c:forEach>
			
		</table>
   	</div>
</div>
</body>
</html>
