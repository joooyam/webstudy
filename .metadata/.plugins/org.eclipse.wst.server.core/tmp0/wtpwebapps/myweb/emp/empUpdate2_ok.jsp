<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <!-- 250306 -->
<jsp:useBean id="edto" class="com.yong.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="edto"/> 
<jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean> <!-- 객체 생성함 -->
<%
int result=edao.empUpdate2(edto);
//사용자한테 응답한 메세지 
String msg=result>0?"사원정보수정성공(beans)":"사원정보수정실패(beans)";
%>
<script>
window.alert('<%=msg%>');
location.href='emp2.jsp';
</script>
