<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!-- 250305 -->
<!-- 사용자로부터 데이터를 입력받는 폼 입력된 데이터 beanTest_ok로 전송 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h2>BeanTest.jsp (실습1)</h2>
   <form name="fm" action="BeanTest_ok">
   <ul>
      <li><label>이름 </label> <input type="text" name="name"></li>
      <li><label>나이 </label> <input type="text" name="age"></li>
      <li><label>전화번호 </label> <input type="text" name="tel"></li>
      <li><label>주소 </label> <input type="text" name="addr"></li>
   </ul>
<div><input type="submit" value="값 전달하기 "></div>
</form>

</body>
</html>