<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 250304 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String name=request.getParameter("name");
String age=request.getParameter("age");
%>
<body>
<h1>paramTest2.jsp</h1>
<form name="paramTest2" action="paramTest3.jsp">
<input type="hidden" name="name" value="<%=name %>">
<input type="hidden" name="age" value="<%=age %>">
<ul>
   <li>전화번호 : <input type="text" name="tel"></li>
   <li>주소 : <input type="Text" name="addr"></li>
</ul>
<div>
   <input type="submit" value="값 넘기기">
</div>
</form>
</body>
</html>