<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<jsp:useBean id="mdto" class="com.yong.phonebook.PhonebookDTO"></jsp:useBean>
<jsp:setProperty property="*" name="mdto"/>
<jsp:useBean id="mdao" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>
<%
int result=mdao.phoneDel(mdto);
String msg=result>0?"회원번호 삭제 성공(beans)":"회원번호 삭제 실패(beans)";
%>
<script>
window.alert('<%=msg%>');
location.href='phonebookForm.jsp';
</script>
