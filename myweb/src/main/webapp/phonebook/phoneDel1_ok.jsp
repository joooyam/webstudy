<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
//250228
String idx=request.getParameter("idx");

Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String pwd="1234";
Connection conn=DriverManager.getConnection(url,user,pwd);
String sql="delete from phonebook where idx=?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setString(1, idx);
int result = ps.executeUpdate();
ps.close();
conn.close();
String msg=result>0?"회원번호 삭제 성공(beans)":"회원번호 삭제 실패(beans)";
%>  
<script>
window.alert('<%=msg%>');
location.href='phonebookForm.jsp';
</script>