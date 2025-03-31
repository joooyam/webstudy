<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%

//250314 login - login_ok

request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
<%
String userid = request.getParameter("userid");
String userpwd = request.getParameter("userpwd");
String saveid=request.getParameter("saveid"); //아이디 기억 아이디 어디에 저장해야 서버의 자원 아끼는 밥 = 쿠키 (db에 하면 사용자서비스 제공해주려다가 자원낭비하게됨)
//아이디 기억은 = 보안성 낮고 정보도 낮음
//어느 시점에 만드는게 중요함 체크하고 로그인 _ok에서 만들지 검증하고나서 쿠키 만들지 고민해보기
//login_ok수행하고나서 쿠키를 만드는데 편하게 사용하는 거니가 체크박스를 사용하기 위한 파일을 만들고 아이디 틀리면 뭐해야되는거지
//로그인이 검증된 이후 사용자가 맞다라고 한 ㅇ이후에 쿠키 생성해줘야함 111. 아이디기억

int result = mdao.loginCheck(userid, userpwd);

if (result==mdao.LOGIN_OK) { //login_ok==3
   //로그인 ok일 때 수행되어야함 //사 용자 id 가져와야함
   String username=mdao.getUserInfo(userid);
   session.setAttribute("sid", userid); //아이디는 사용자의 요구사항에 따라 아이디가 저장해야될지 결정
   session.setAttribute("sname", username);
   
   //아이디 기억 순서 2 null이 아닐 때만 쿠키 생성해주기  
   if(saveid!=null){
	  Cookie ck=new Cookie("saveid",userid);
	  ck.setMaxAge(60*60*24*30);
	  //레스폰스로 아이디 저장
	  response.addCookie(ck);//사용자가 아이디 사용하고 싶지 않아서 쿠키 지우는 것도 필요함
	 
	  //쿠키 지우는 방법 = 수명을 0으로 셋팅해두면 지운다는게 아니라 가자마자 지우는 것이므로 살자마자 죽으므로 삭제를 의미하므로
	  //해당 나이 0으로 셋팅하는법
   }else{
	   Cookie ck=new Cookie("saveid",userid);
		  ck.setMaxAge(0); //만들자마자 삭제
		  response.addCookie(ck);
   }//4.쿠키 정보활용 로그인 창으로 가기 head body사이에서 사용자 아이디값가져올거임
   %>
     <script>
     window.alert('<%=username%>님 환영합니다~');
     //나를 가르키는 키워드 opener를 이용해 reload를 가리키면 f5누를 거와 동일해짐
     opener.location.reload();
     window.self.close();
     </script> 
   <%
} else if (result==mdao.NOT_ID||result==mdao.NOT_PWD) {
   %>
   <script>
   window.alert('ID 또는 비밀번호가 잘못되었습니다.')
   location.href="login.jsp";
   </script>
   <%
} else if (result==mdao.ERROR) {
   out.println("고객센터 연락바람~");
}
%>
