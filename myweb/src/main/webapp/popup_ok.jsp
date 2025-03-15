<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
String popupck=request.getParameter("popupck");
//popupck라는 파라미터를 얻어옴 (value값이 존재하냐.안하냐가 중요함)
if(popupck!=null){
	//데이터 존재하냐 안하냐로 중요 value값 중여한데
	//popupck 옆에 2번쨰에 넣는 값은 value값을 넣어줘야함
	Cookie ck=new Cookie("popupck","on");
	//5. 클릭한 시점에서 24시간 쿠키도 저장해줘야함 (24시간에 대한 second값 넣어줌)
	ck.setMaxAge(60*60*24);
	response.addCookie(ck);
	}%>
	<script>  <!--null이냐고 비교했더니 close가 중복된 것을 확인가능함-->
	window.self.close();
	</script>
<%
//4_1. 체크된 값이 없으면 단순 팝업 종료
//4_2. 체크된 값이 있으면 쿠키생성 팝업종료

%>
