<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title> 250311 </title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css">

</head>
<body>
<%@include file="../header.jsp" %> <!-- / 만 하면 절대경로 ../ 이면 상대경로 -->
<section>
	<article>
		<h2>회 원 검 색</h2>
		<form name="memberFind" method="post"  action="memberFind.jsp">
			<fieldset>
			 <legend>회원검색</legend>
			 	<select name="fkey">
			 		<option value="id">아이디</option>
			 		<option value="name">이름</option>
			 	</select>
			 	<input type="text" name="fvalue" >
			 	<input type="submit" value="검색">
			</fieldset>
		</form>
	</article>
	<article>
			<fieldset>
			 <legend>검색결과</legend>
			 <%
			 //GET, POST 방식 구분하는 법 GET과 동일하다면
			 if(request.getMethod().equals("GET")){
				 %>
				 <h3>위 검색란에 검색어를 입력해주세요</h3>
				 <%
			 }else{
				 %>
				 <!-- 수행결과 가져오기 -->
			<jsp:include page="result.jsp"></jsp:include>
				<% 
			 }
			 
			 %>
		
			</fieldset>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>