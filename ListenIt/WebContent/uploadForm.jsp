<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8"
		name="viewprot"
		content="width=divice-width,initial-scale=1.0">
	<link rel="stylesheet" href="css/upload.css"/>
	<title>음악 올리기</title>
	<script>
	function goSubmit() {	//팝업창 submit 스크립트
	    window.opener.name = "uploadProc"; // 부모창의 이름 설정
	    document.fileForm.target = "uploadProc"; // 타켓을 부모창으로 설정
	    document.fileForm.action = "/ListenIt/uploadProc.it";
	    document.fileForm.submit();
	    self.close();
	}
	
	var items = 0;
	
	function addItems(){ // 업로드 항목 추가 스크립트
		items++;		
		var title_table = document.getElementById("title_table");
		
		var index1 = title_table.rows.length;
		var newTr1 = title_table.insertRow(index1);
		
			var newTd1 = newTr1.insertCell(0);
			newTd1.className = "title";
			newTd1.innerHTML = "제목";
			
			var newTd2 = newTr1.insertCell(1);
			newTd2.innerHTML ="<input type='text' name='song_name'/>";
			
			var newTd3 = newTr1.insertCell(2);
			newTd3.className = "title";
			newTd3.innerHTML = "가수";
			
			var newTd4 = newTr1.insertCell(3);
			newTd4.innerHTML ="<input type='text' name='singer_name'/>";
		
		var index2 = title_table.rows.length;
		var newTr2 = title_table.insertRow(index2); 
			
			var newTd5 = newTr2.insertCell(0);
			newTd5.colSpan = "3";
			newTd5.className = "title";
			
			newTd5.innerHTML = 
			"<input type='file' name='uploadFile" + items + "' id='uploadFile'>";
			alert(items);
			
			var newTd6 = newTr2.insertCell(1);
			newTd6.className = "title";
			newTd6.innerHTML =
			"<input type='button' value='추가' onclick='addItems();'>";
			
			//alert(title_table.rows.length)
		if(index2 > 10){
			alert("더이상 항목을 추가할 수 없습니다.");
			return;
		}
		
	}
	</script>
</head>
<body>
	<form name="fileForm" id="fileForm" method="post" action="/ListenIt/UploadProc.it" enctype="multipart/form-data">
		<p class="title">** 게시글의 제목으로 반영됩니다 ex) 제목 - 가수 **</p>
	    <table id="title_table">
			<tr>
				<!--  <td><input id="files-upload" type="file" multiple></td> 다중 업로드 -->
				<td class="title">제목</td>
				<td><input type="text" name="song_name"/></td>
				<td class="title">가수</td>
				<td><input type="text" name="singer_name"/></td>
			</tr>
			
			<tr>
				<td class="title" colspan="3"><input type="file" name="uploadFile0" id="uploadFile"></td>
				<td class="title"><input type="button" value="추가" onclick="addItems();"></td>
			</tr>
			
		</table>
		<br><br>
		
	    <input type="submit" onclick="goSubmit()" value="올리기">
</form>
</body>
</html>