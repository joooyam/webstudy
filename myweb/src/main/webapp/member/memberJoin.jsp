<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css">

<style>

h2{
   text-align: center;
}

fieldset{
   width:550px;
   margin:0px auto;
}

fieldset li{
   list-style: none;
}

fieldset label{
   width: 90px;
   float : left;
   
}

fieldset div{
   text-align : center;
   
}
</style>

<script>
   function openIdCheck(){
      window.open('idCheck.jsp','idCheck','width=500,height=250');
   }


</script>

</head>
<body>
<%@include file="../header.jsp" %>

<section>
   <article>
      <h2>회 원 가 입</h2>
      <form name = "memberJoin" action="memberJoin_ok.jsp" method="post">
      <!-- 비밀번호는 중요하니 post로 전송, 버퍼형식으로 전달하니 깨진 계란으로 전달하는 것, post방식으로 전달하면 인코딩 재조정해야함 -->
         <fieldset>
            <legend>정보입력</legend>
            <ul>
               <li><label>ID</label><input type="text" name="id" readonly>
               <input type="button" value="중복검사" onclick="openIdCheck();"></li>
               <li><label>Password</label><input type="password" name = "pwd"></li>
               <li><label>Name</label><input type="text" name = "name"></li>
               <li><label>Email</label><input type="text" name="email"></li>
               <li><label>Telephone</label><input type="text" name="tel"></li>
               <li><label>Address</label><input type="text" name="addr"></li>
            </ul>
            <div>
               <input type="submit" value="회원가입">
               <input type="reset" value="다시 작성">
            </div>
         </fieldset>
      
      
      
      
      </form>
   
   </article>

</section>


<%@include file="/footer.jsp" %>
</body>
</html>