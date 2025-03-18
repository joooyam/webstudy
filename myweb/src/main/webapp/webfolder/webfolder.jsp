<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250318 폴더 껍데기 만들기</title>
<link rel="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>
h2{
	text-align: center;
	color: skyblue;
}
section li{
	list-style-type: none;
}
section label { 
	width : 120px;
	float: left;
}
table{
	width: 550px;
	margin : 0px auto;
	border-top: 3px double darkblue;
	border-bottom: 3px double darkblue;
}
table th{
	background-color:skyblue;
}
meter{
	width:200px
}
</style>
<%
//section의 자손태그중 label이 있다면 공통적으로 다들 120px로 바꿀거임
//	margin : //0px auto 상하0 팍샐 
%>
</head>
<body>
<%@include file="/header.jsp"%>
<section>
	<article>
		<h2>Y 드라이브</h2>
		<fieldset>
			<legend>사용정보</legend>
			<ul>
				<li><label>총용량 :</label><meter max="100" min="0" value="100"></meter>(byte)</li>
				<li><label>사용용량 :</label><meter max="100" min="0" value="70"></meter>(byte)</li>
				<li><label>남은용량 :</label><meter max="100" min="0" value="30"></meter>(byte)</li>
			</ul>
		</fieldset>
	</article>
	<article>
		<div>
			<input type="button" value="파일 올리기">
			<input type="button" value="폴더 만들기">
		</div>
		<fieldset>
			<legend>탐색기</legend>
			<table>
				<thead>
					<tr>
						<th>구분</th>	
						<th>파일 및 폴더먕</th>	
						<th>삭제</th>	
					</tr>		
				</thead>
			</table>
		</fieldset>
	</article>
</section>
<%@include file="/footer.jsp"%>
</body>
</html>