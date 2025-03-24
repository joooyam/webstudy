<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="bdto" class="com.yong.bbs.BbsDTO" ></jsp:useBean>
<jsp:setProperty property="*" name="bdto"/>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
// 250324 게시물 작성 ok서버
int result=bdao.bbsWrite(bdto);
String msg=result>0?"글쓰기 성공!":"글쓰기 실패!";
%>
<script>
window.alert('<%=msg%>');
location.href='bbsList.jsp';
</script>