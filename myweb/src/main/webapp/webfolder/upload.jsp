<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250320 탐색기 2. 파일 올리기 버튼 만들기 </title>
</head>
<body>
<form name="fileupload" action="upload_ok.jsp"
method="post" enctype="multipart/form-data">
<fieldset>
	<legend>파일 올리기</legend>
	<ul>
		<li><label>파일</label>
		<input type="file" name="upload"></li>
	</ul>
	<div>
		<input type="submit" value="업로드">
	</div>
</fieldset>

</form>
</body>
</html>