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
	
	
	function addItems(){ // 업로드 항목 추가 스크립트
		var upload_table = document.getElementById("upload_table");
		var index = upload_table.rows.length
		if(index > 9){
			alert("더이상 항목을 추가할 수 없습니다.");
			return;
		}
		var newTr = upload_table.insertRow(index);
		var newTd = newTr.insertCell(0);
		newTd.align = "left";
		//newTd.width = "100%";
		newTd.innerHTML = 
		"<input type='file' name='uploadFile" + index + "' id='uploadFile'>";
		
		
		var upload_table1 = document.getElementById("title_table");
		if(index > 9){
			alert("더이상 항목을 추가할 수 없습니다.");
			return;
		}
		var newTr1 = title_table.insertRow(index);
		var newTd_no1 = newTr1.insertCell(0);
		newTd_no1.innerHTML = "제목";
		newTd_no1.className = "title";
		var newTd1 = newTr1.insertCell(1);
		newTd1.align = "left";
		//newTd.width = "100%";
		newTd1.innerHTML ="<input type='text' name='song_name'/>"
		
		var newTd_no2 = newTr1.insertCell(2);
		newTd_no2.innerHTML = "가수";
		newTd_no2.className = "title";
		var newTd2 = newTr1.insertCell(3);
		newTd2.align = "left";
		//newTd.width = "100%";
		newTd2.innerHTML ="<input type='text' name='singer_name'/>"
		
	}
	</script>
</head>
<body>
	<form name="fileForm" id="fileForm" method="post" action="/ListenIt/UploadProc.it" enctype="multipart/form-data">
	    <table id="title_table">
			<tr>
				<!--  <td><input id="files-upload" type="file" multiple></td> 다중 업로드 -->
				<td class="title">제목</td>
				<td><input type="text" name="song_name"/></td>
				<td class="title">가수</td>
				<td><input type="text" name="singer_name"/></td>
			</tr>
			<tr>
				<td class="title" colspan="4">** 게시글의 제목으로 반영됩니다 ex) 제목 - 가수 **</td>
			</tr>
			
		</table>
		<br>
		<table id="upload_table">
			<tr>
				<td><input type="file" name="uploadFile" id="uploadFile"></td>
				<td><input type="button" value="추가" onclick="addItems();"></td>
			</tr> 
		</table>
		<br><br><br><br>
	    <input type="submit" onclick="goSubmit()" value="올리기">
</form>
</body>
</html>