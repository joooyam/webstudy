<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 로그아웃 : 사용자가 그 서비스를 더이상 받지 않겠다는 의미 -->  
<%
//250314


//초기화 = invalidate();
session.invalidate();
response.sendRedirect("/myweb");  //web.xml이 젤 먼저 읽는데 welcom파일에 목록들 있는데 myweb이라는 거 실행하면 있는 거 실행하겠다 라고 함

%>
