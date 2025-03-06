<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!-- 250228 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp"%>
   <section>
      <article><h2>사칙연산결과</h2></article>
      
      <%
      String num1_s=request.getParameter("num1");
      
      if(num1_s==null||num1_s.equals("")){ //null은 아니지만 null과 같은 상황 => 빈문자열 or 길이가 0일때
         num1_s="0";
      }
      
      int num1 = Integer.parseInt(num1_s);
      
      String num2_s=request.getParameter("num2");
      int num2 = Integer.parseInt(num2_s);
      //int num2=Integer.parseInt(request.getParameter("num2"));
      // 위는 웹에선 권장X, 데이터의 관한 유효성 검사 스킵해버림 -> 그래서 단계적으로 적는 것이 좋음
      

      String oper_s=request.getParameter("oper");
      
      char oper = oper_s.charAt(0);
      int result = 0;
      
      switch(oper){
         case '+' : result = num1 + num2; break;
         case '-' : result = num1 - num2; break;
         case '*' : result = num1 * num2; break;
         case '/' : result = num1 / num2; break;
      }
      
      %>
      
      <h3><%=num1%><%=oper%><%=num2%>=<%=result %></h3>
   </section>



<%@include file="footer.jsp"%>
</body>
</html>