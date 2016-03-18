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
		<link rel="stylesheet" type="text/css" href="css/style9.css" />
 
<script>
function getCheckBox() {
	var leng = list.rows.length;
	alert(leng);
	for(i=0; i<10; i++){
		var check = document.getElementById("check"+i);
		if(check.style.display == "none"){
			check.style.display="";
		}else{
			check.style.display="none";
		}
	}
	
}
</script>

</head>

<body>
 <div class="header">
	<div id="top_navi">
	   <ul>
			<li><a href="#">CATEGORY</a></li>
			<li><a href="#">LOGIN</a></li>
	        <li><a href="#">JOIN US</a></li>
		    <li><a href="#">BASKET</a></li>
		    <li><a href="#">ORDER</a></li>
		    <li><a href="#">MY SHOPPING</a></li>
			<li><a href="#">MY INFO</a></li>
		</ul>
	</div><!-- navi -->
    <div id="logo">
	    <a href="xmlParse.jsp"><h1><img src="img/title.jpg" width="200" height="108" alt="logo" /></h1></a>		
    </div><!-- logo -->    
    <div id="small_navi">
		<ul>
			<li><a href="#">NOTICE</a></li>
			<li><a href="#">REVIEW</a></li>
			<li><a href="#">Q&A BOARE</a></li>
			<li><a href="#">EVENT</a></li>
		</ul>
    </div> <!-- small_navi -->
	<div id="big_navi">
		<ul>
			<li><a href="#">TOP_TEE</a><span class="boder"></span></li>
			<li><a href="#">OUTER</a><span class="boder"></span></li>
			<li><a href="#">OUTWEAR</a><span class="boder"></span></li>
			<li><a href="#">BLOUSE</a><span class="boder"></span></li>
			<li><a href="#">SKIRT</a><span class="boder"></span></li>
			<li><a href="#">DRESS</a><span class="boder"></span></li>
			<li><a href="#">TOP_OES.BAG<span class="boder"></span></a></li>
			<li><a href="#">ACCESSORY<span class="boder"></span></a></li>
			<li><a href="#">ON SALE<span class="boder"></span></a></li>
		</ul>

	</div><!-- big_navi -->
  </div><!--header -->
  
  <div id="content">	
  	<div id="list_t">
  	<div class="header" id="big_navi">
		  		<input type="button" value="편집" onclick="getCheckBox();">
				<input type="button" value="선택듣기" onclick="#">
				<input type="button" value="선택다운" onclick="#">
				<input type="button" value="선택반전" onclick="#">
				<a onclick="window.open('/ListenIt/uploadForm.it','','scrollbars=no, width=600,height=600,left=400,top=90');return false">
				<input type="button" value="올리기">
				</a>
	</div>				
		<table class="header" id="list">
			<tr class="song_list">
				<td width="5" id="check0" style="display:none;"><input type="checkbox"></td>
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
				<td width="5" id="check<%= ++i %>" style="display:none;"><input type="checkbox"></td>
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
