<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!--250304 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp"%>
<section>
   <article>
      <h2>사원 검색</h2>
<%
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:orcle:thin:@localhost:1521:xe";
String user="scott";
String pwd="1234";
Connection conn=DriverManager.getConnection(url,user,pwd);
String sql="select from employee2 where name=?";
PreparedStatement ps=conn.prepareStatement(sql);
ResultSet rs = ps.executeQuery();

if(rs.next()){
   do{
%>
<tr>
   <td><%=rs.getInt("idx") %></td>
   <td><%=rs.getString("name") %></td>
   <td><%=rs.getString("email") %></td>
   <td><%=rs.getString("dept") %></td>
</tr>
<%
   }while(rs.next());
}else{
%>
<tr>
   <td colspan='4' align="Center">
   등록된 사원이 없습니다.
   </td>
</tr>
<% 
   }
rs.close();
ps.close();
conn.close();
%>
   </tbody>
      </table>
   </article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>
