<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
/////250304
int idx=Integer.parseInt(request.getParameter("idx"));
String name=request.getParameter("name");
String email=request.getParameter("email");
String dept=request.getParameter("dept");

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String pwd="1234";
Connection conn=DriverManager.getConnection(url,user,pwd);
String sql="update employee2 set name=?,email=?,dept=? where idx=?"; //idx를 기준으로 바꿀게
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1, name);
ps.setString(2, email);
ps.setString(3, dept);
ps.setInt(4, idx);
int count=ps.executeUpdate();
ps.close();
conn.close();
String msg=count>0?"사원 정보 수정 성공!" : "사원정보 수정 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='emp.jsp';
</script>
