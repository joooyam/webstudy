<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 250318 3.이미지 올리기 코드 써야되는 것이 정형화되어있음</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<script>
function show(imgcomp){
	var filename=imgcomp.value;
	filename=filename.substring(filename.length-3); //3을 빼서
	if(filename!='jpg'){
		//해당 이미지 콤프가 가지고 있는 value값이 ''문자열이라면
		alert('jpg이미지만 가능합니다');
		imgcomp.value='';
	}
	//alert(filename);
}
</script>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
	<article>
		<h2>이미지 업로드</h2>   <!-- 이미지 보내야하므로 ok-->
		<form name="imgUpload" action="imgUpload_ok.jsp" method="post"
		enctype="multipart/form-data">
		<fieldset>
			<legend>이미지 업로드</legend>
			<ul>
				<li><label>이미지</label>      <!--this 넘기면 이미지 컴포너틑 이미지콤프이 파일의 요소가 됨 onchange="show(this)" 
				accept가 jpg로만  accept=".jpg" 저장되게 함-->
				<input type="file" name="imgname" onchange="show(this)" ></li>
			</ul>
			<div>
				<input type="submit" value="업로드">
			</div>
		</fieldset>
		</form>
	</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>