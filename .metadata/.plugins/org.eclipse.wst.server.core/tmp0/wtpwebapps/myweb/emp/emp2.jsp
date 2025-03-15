<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 250305 -->

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
fieldset{
   width:400px;
   margin:0px auto;
}
table{
   margin: 0px auto;
}
</style>
</head>
<body>
<%@include file="../header.jsp" %>
<section>
   <article>
      <h2>사원관리 프로그램 (beans방식)</h2>
      <form name="empAdd2" action="empAdd2_ok.jsp" method="post">
      <fieldset>
         <legend>사원등록</legend>
         <table>
            <tr>
               <th>사원이름</th>
               <td><input type="Text" name="name"></td>
            </tr>
            <tr>
               <th>E-mail</th>
               <td><input type="Text" name="email"></td>
            </tr>
            <tr>
               <th>부서명</th>
               <td><input type="Text" name="dept"></td>
            </tr>
            <tr>
               <td colspan="2" align="center"></td>
               <td><input type="submit" value="사원등록"></td>
               <td><input type="reset" value="다시작성"></td>
            </tr>
         </table>
      </fieldset>
      </form>
   </article>
   <article>
   <form name="empDel2" action="empDel2_ok.jsp">
   <fieldset>
      <legend>사원퇴사</legend>
         <table>
            <tr>
               <th>사원이름 </th>
               <td><input type="Text" name="name"></td>
               <td><input type="submit" value="사원퇴사"></td>
            </tr>
         </table>
   </fieldset>
   </form>
   </article>
   <article>
   <fieldset>
         <legend>모든 사원 내역보기</legend>
         <h3><a href="empList2.jsp">모든 사원 내역 보기</a></h3>
   </fieldset>
   </article>
      <article>
   <fieldset>
         <legend>모든 사원 내역보기</legend>
         <h3><a href="empList3.jsp">모든 사원 내역 보기</a></h3>
   </fieldset>
   </article>
   <article>
   <form name="empUpdateSel2" action="empUpdate2.jsp">
   <fieldset>
      <legend>사원 정보 수정</legend>
               <table>
            <tr>
               <th>사원번호 </th>
               <td><input type="Text" name="idx"></td>
               <td><input type="submit" value="정보수정"></td>
            </tr>
         </table>
   </fieldset>
   </form>
   </article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>