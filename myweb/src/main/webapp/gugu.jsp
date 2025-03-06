<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 250227 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>jsp로 만든 구구단</h1>
<%
out.println("<table width='550' border='1'>");
for(int i=2; i<=9; i++) {
   out.println("<tr>");
   for(int j=1; j<=9; j++){
      out.println("<td>");
      out.println(i+"*"+j+"="+(j*i));
      out.println("</td>");
   }
   out.println("</tr>");
}
out.println("</table>");
%>
<hr>
<table width="550" border="1">
   <%for(int i=1; i<=9; i++){ %>
   <tr>
      <%for(int j=2; j<=9; j++){ %>
      <td><%=j %>X<%=i %>=<%=i*j %></td>
      <%} %>
   </tr>
   <%} %>
</table>
</body>
</html>