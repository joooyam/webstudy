<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sub.jsp에서 super.jsp를 가져오는 기법</title>
</head>
<body>
<h1>250310 sub.jsp</h1>
<h3 style="color:red;">sub.jsp에서 출력한 문장 A</h3>
<%
String str2="JSP";   //파라미터를 받아야지 페이지-페이지 전달 가능해짐
String str=request.getParameter("str");
String str3=request.getParameter("test");
%>

<h3 style="color:red;">sub.jsp에서 출력한 str의 값:<%=str2 %></h3>
<h3 style="color:green;">super에서 가져온 문장 = str=<%=str %></h3>
<h3 style="color:red;">sub.jsp의 test파라미터 값:<%=str3 %></h3>
<h3 style="color:red;">sub.jsp에서 출력한 문장 B</h3>
</body>
</html>

<%//전혀 다른 페이지라면 파라미터로 데이터를 넘겨줘야됨(다른 페이지라는 걸 인식해야됨) %>

