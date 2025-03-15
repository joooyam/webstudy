<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="border:1px solid gray; width:400px; height:350px;">
	<h1 style="text-align: center;">공 지 사 항</h1>
	<h3>1. 지각을 하지 맙시다. </h3>
	<h3>2. 결석을 하지 맙시다. </h3>
	<h3>3. 건강관리 유의합시다. </h3>
	<h3>4. 복습을 철저히 합시다. </h3>
	<!-- 인덱스로 접속하면 (이벤트 줘야됨 : onload) -->
</div>
<form name="fm" action="popup_ok.jsp"> <!-- 3.서버에 전달 -->
<input type="checkbox" name="popupck" value="on" >오늘 하루 안보기.
<input type="submit" value="[닫기]"> 
<!-- 체크되면 값이 on인데, 기본적으로 체크되면 on이라는 value값이 보내진다고 명시하기 위해서 -->
</form>
</body>
</html>