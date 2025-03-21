<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%
String target=request.getParameter("target");
wf.oneFileDelete(target);
response.sendRedirect("webfolder.jsp?crpath="+wf.getCrpath()); //웹폴더.jsp로 이동할때 crpath를 작성해줌으로써 이동하게 됨
%>

