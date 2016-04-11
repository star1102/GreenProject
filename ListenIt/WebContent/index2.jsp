<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<html>
<head>
<link href="css/main.css" rel="stylesheet"type="text/css">
<script type="text/javascript" src="js/jquery-1.11.3.min.js"></script>

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
	
<title> 리슨it </title>
	<meta charset="UTF-8">
<body>
	<div id="wrap"></div>
	<header>
	<div id="logo">
	<img src="img/title.jpg" alt="리슨잇" width="200" height= "100">
	</div>
	<div id="head_link">
		<ul>
			<li><a href="#">로그인</a><li>
			<li class="no line"><a href="#">회원가입</a><li>
		</ul>
	</div>
		<br>
	<div id="search">
	<form>
		<input name="input" type="text" class="main_input">
		<input name="search" type="button" value="검색" class="btn1">
	</form>
    </div>
  </header>
  
  <div class="clear"></div>
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
					<li><a href="#">FNQ</a></li>
					<li><a href="#">이벤트</a></li>
				</ul>
				</li>
	</ul>				
</nav>
</body>
</html>
		