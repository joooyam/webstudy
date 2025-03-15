<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.yong.phonebook.*" %>
<jsp:useBean id="pdto" class="com.yong.phonebook.PhonebookDTO"></jsp:useBean>
<jsp:setProperty property="*" name="pdto"/>
<jsp:useBean id="pdao" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>
	<%
//String name=request.getParameter("name"); 
//String tel=request.getParameter("tel");
//String addr=request.getParameter("addr");
//PhonebookDTO dto=new PhonebookDTO(0,name,tel,addr); //카트에 담아놓음
//이 4줄은 usebean, setProperty와 동일


//PhonebookDAO dao=new PhonebookDAO();//내가 만든DAO객체로부터 PHONEADDF를 호출해 dto를 넘기고 결과를 받는것
//int result=dao.phoneAdd(dto); 위에 dao생성자 호출한거 작성해서 이렇게 작성했는데
//위에 usebean작성했으므로 밑에 pdao이런식으로 바꿈


	int result=pdao.phoneAdd(pdto);
	String msg=result>0?"전화번호등록성공(bean)!":"전화번호등록실패(bean)";
	%>
	<script>
	window.alert('<%=msg%>');
	location.href="phonebookForm.jsp";
	//로케이션이 가지고 있는 하이퍼로케이션을 이용해 phoneForm.jsp로 이동할 수 있도록
	</script>
