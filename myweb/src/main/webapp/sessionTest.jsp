<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250313 세션테스트</title>
</head>
<body>
<h1>250313 sessionTest.jsp</h1>
<%
//2. 데이터 뽑아오기
String name=(String)session.getAttribute("name");
//type mismatch오류 떠서 다운캐스팅 해야됨
//3. 다운캐스팅
Integer age=(Integer)session.getAttribute("age");
%>
<h2>이름:<%=name %></h2>
<h2>나이:<%=age %></h2>
<%
///1. 데이터 저장함
session.setAttribute("name", "홍길동");
//키값 = name, value="홍길동"
session.setAttribute("age", 20);
//세션 객체에 이름, 나이 저장됨
%>
</body>
</html>