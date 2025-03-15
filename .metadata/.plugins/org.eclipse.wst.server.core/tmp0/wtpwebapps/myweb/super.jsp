5<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>super.jsp에서 sub.jsp를 가져오는 기법</title>
</head>
<body>
<h1>250310 super.jsp</h1>
<h3 style="color:blue;">super.jsp에서 출력한 문장 A</h3>
<%
String str="java";
String str3=request.getParameter("test");
%>
<h3 style="color:blue;">super.jsp에서 출력한 str의 값:<%=str %></h3>
<h3 style="color:blue;">super.jsp에서 출력한 test파라미터 값:<%=str3 %></h3>

<jsp:include page="sub.jsp">
			<jsp:param value="<%=str %>" name="str"/>
</jsp:include>


<%
//////////////////////////////////////////////////////
/**<!--jsp:include page="sub.jsp"></jsp:include-->

<!--  %inlcude file="sub.jsp" %-->*/
%>
<h3 style="color:blue;">super.jsp에서 출력한 문장 B</h3>
</body>
</html>