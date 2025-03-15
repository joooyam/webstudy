<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 250305 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
String name=request.getParameter("name");
String age_s=request.getParameter("age");
int age=Integer.parseInt(age_s);  //파싱
String addr=request.getParameter("addr");
String tel=request.getParameter("tel");
%>
<body>
<h1>BeanTest_ok.jsp</h1>

<!-- beanTest객체 생성 -->
<jsp:useBean id="btest" class="com.yong.bean.BeanTest"></jsp:useBean>
<!-- setProperty를 사용해 받아온 데이터로를 객체에 설정 -->
<!--객체의 속성에 값을 설정하는 역할  객체의 속성은 멤버변수를 의미, 이 값을 자바 빈 객체에 저장-->
<jsp:setProperty property="name" name="btest" value="<%=name%>"/>
<jsp:setProperty property="age" name="btest" value=<%=age %>/>
<jsp:setProperty property="tel" name="btest" value=<%=tel %>/>
<jsp:setProperty property="addr" name="btest" value=<%=addr %>/>
<!-- beanTest객체에 설정된 값을 출력 -->
<h3>이름:<jsp:getProperty property="name" name="btest" ></h3>
<h3>나이 : <%btest.getAge(); %></h3> <!-- 은닉화했을 때 get(set)을 써서멤버변수에 접근할 수 있도록 객체를 통해 가져온 것 -->
<h3>전화번호 : <%btest.getTel(); %></h3>
<h3>주소 : <%btest.getAddr(); %></h3>
</body>
</html>
