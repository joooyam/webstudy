<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  상단 !!! -->

<script> 
// ' / ' 쓰면 절대겨경로가 되는데 절대경로 써야됨(?)
// 이렇게 써야 어느 위치에든 열 수 있음
function openLogin(){
	window.open('/myweb/member/login.jsp','login','width=550,height=350');
}
</script>
 <%
 //로그인 창 250314
 String sname=(String)session.getAttribute("sname"); //object파일로 저장되므로 다운캐스팅 해줘야 사용 가능함
 %>

 <header> <!-- ui 변하지 않지만 컴퓨터가 상단으로 인식함 -->
      <%
      if(sname==null){
    	  %>
    	   <div><a href="javascript:openLogin()">로그인</a>
    	   <a href="/myweb/member/memberJoin.jsp">회원가입</a></div>
    	   <%
      }else {
    	  %>
    	<div> <%=sname%>님 로그인중..... | <a href="/myweb/member/logout.jsp">로그아웃</a></div>
    		<%
      }
      %>
      <!-- javascipt 쓸 수 있음openLogin함수 열도록 함 -->
     
      <h1>JSP Study Site</h1>
      <nav><!-- nav 시각적인 의미는 없지만  컴퓨터는 메뉴영역으로 인식함 -->
         <ul>
            <li><a href="/myweb">Home</a></li><!-- 메뉴는 보통 링크로 감싸줘서 클릭대상자로 설정 -->
            <li><a href="#">Profile</a></li>
            <li><a href="#">자유게시판</a></li>
            <li><a href="#">파일업로드</a></li>
            <li><a href="#">방명록</a></li>
         </ul>
      </nav>
   </header>