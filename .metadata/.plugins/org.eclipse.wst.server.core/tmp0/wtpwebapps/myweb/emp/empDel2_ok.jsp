<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 250305 -->
<jsp:useBean id="edto" class="com.yong.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="edto"/>
<jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean> <!-- 객체 생성함 -->
<%
int result=edao.empDel(edto);
String msg=result>0?"사원퇴사성공(beans)":"사원퇴사실패(beans)";
%>
<script>
window.alert('<%=msg%>');
location.href='emp2.jsp';
</script>
