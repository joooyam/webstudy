<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 250227 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp" %>
<section>
   <article>
      <h1>넘어온 파라미터 확인</h1>
      <%
      String name=request.getParameter("name");
      String pwd=request.getParameter("pwd");
      String se=request.getParameter("se");
      //String cbs=request.getParameter("cbs");
      String cbs[]=request.getParameterValues("cbs");
      %>
      <h3>넘어온 이름 : <%=name %></h3>
      <h3>넘어온 비밀번호 : <%=pwd %></h3>
      <h3>넘어온 성별 : <%=se %></h3>
      <h3>넘어온 취미 :
      <%
      if(cbs==null || cbs.length==0){
         out.println("사용자가 선택한 취미가 없습니다.");
      }else{
         for(int i=0; i<cbs.length; i++){
            out.println(cbs[i]+"&nbsp;");
         }
      }
      %>
      
      </h3>
   </article>
</section>
<%@include file="footer.jsp" %>
</body>
</html>