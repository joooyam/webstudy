<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250313</title>
</head>
<body>
<h1>scopeTest.jsp</h1>
<!-- usebean액션 태그는 스코프 속성이 있음 -->
<jsp:useBean id="stest" class="com.yong.scope.ScopeTest" scope="application"></jsp:useBean>

<!-- //카운트 값은 stest라는 공간에 담아둠 -->
<jsp:setProperty property="count" name="stest"/>

<h2 style="color:blue;">현재 count의 값:<%=stest.getCount() %></h2>
<a href="scopeTest_ok.jsp">다음 페이지로...</a>
</body>
</html>