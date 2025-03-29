<%@page import="com.yong.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>

<%
// 250307
request.setCharacterEncoding("utf-8");
%>
<!--  -->
<jsp:useBean id="mdto" class="com.yong.member.MemberDTO"></jsp:useBean>
<!-- MemberDTO mdto=new MemberDTO(); -->
<jsp:setProperty property="*" name="mdto" />
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
//MemberDTO mdto = new MemberDTO();

int result = mdao.memberJoin(mdto);
String msg = result > 0 ? "회원가입을 축하합니다" : "회원가입에 오류가 발생하였습니다.";
%>
<script>
   window.alert('<%=msg%>');
   location.href = '/myweb/index.jsp';
</script>