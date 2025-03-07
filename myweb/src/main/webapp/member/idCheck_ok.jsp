<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean> <!-- 기능객체 가져옴 -->
 <%
 String userid=request.getParameter("userid");
 boolean result=mdao.idCheck(userid); //false면 데이터 없고 true면 데이터 있는 것

 if(result){
	 %>
	 <script>
	 window.alert('이미 가입되어있는 아이디입니다.');
	 location.href='idCheck.jsp';
	 </script>
	 <%
 }else{
	 %>
	 <script>
	 window.alert('<%=userid%>는 사용가능한 아이디입니다.');
	 //나를 가르키는 키워드 opener
	 //나를 가리ㅡ키는 키둬르보ㅜ터 
	 opener.document.memberJoin.id.value='<%=userid%>';
	 window.self.close();
	 </script>
	 <%
 }
 %>
