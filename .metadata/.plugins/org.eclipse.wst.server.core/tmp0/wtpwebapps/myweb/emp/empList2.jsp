<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="com.yong.emp.*"%>
 <jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean>
  <!-- 250306 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
<style>
h2{
   text-align: center;
}
table{
   margin: 0px auto;
   border-top:3px double darkblue;
   border-bottom:3px double darkblue;
   width:550px;
}
table th{
   background-color: skyblue;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
   <article>
      <h2>모든 사원 내역(beans의 1번째)</h2>
      <table>
         <thead>
            <tr>
               <th>사원번호</th>
               <th>사원이름</th>
               <th>E-mail</th>
               <th>부서명</th>
            </tr>
         </thead>
         <tbody>
         <%
         EmpDTO dtos[]=edao.empListPar1();//edao. 객체로부터 가져옴
         if(dtos==null||dtos.length==0){
            %>
            <tr>
               <td colspan="4" align="center">
               등록된 사원이 없습니다
               </td>
            </tr>
            <% 
         }else{
            for(int i=0; i<dtos.length; i++){
               EmpDTO temp=dtos[i];
               %>
               <tr>
                  <td><%=temp.getIdx() %></td>
                  <td><%=temp.getName() %></td>
                  <td><%=temp.getEmail()%></td>
                  <td><%=temp.getDept()%></td>
               </tr>
               <%
            }
         }
         
         %>
         </tbody>
      </table>
   </article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>