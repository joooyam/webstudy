<%@page import="java.io.File"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
response.setContentType("text/html;charset=utf-8");
String uploadfol=request.getParameter("uploadfol");
File f=new File(wf.getBasepath()+"/"+wf.getCrpath()+"/"+uploadfol); //getUserid에서 바꿔줌
f.mkdir();
%>

<script>
window.alert('파일 업로드 성공!');
opener.location.href='webfolder.jsp?crpath=<%=wf.getCrpath()%>';
window.self.close();
</script>
