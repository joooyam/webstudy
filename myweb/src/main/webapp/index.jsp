<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
 <%@ page import = "java.net.*" %>
<%@ page import = "java.util.*" %>
<!-- 250227 ing-->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> <!-- 콘텐츠만 있는 영역 -->
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
<script>
function openPopup(){
	window.open('popup.jsp','popup','width=450, height=400'); <!--250314 로그인 창 -->
}
//쿠키의 배열을 가져오고 요소들에 접근해서 내가 원하는 키값이 있는 지 확인
//키 값이 있으면 value값 추출
//전에 했던게 쿠키 가져오는 코드 이용해서 한 번 더 쓰고 이용!

</script>
</head>
      <%
      String lastDay="첫 방문이시군요!!";
      String popupck=null;
      //쿠키의 배열을 가져옴 요청받을 때 정보를 가져와야하므로 request객체 사용
      Cookie cks[]=request.getCookies();
      //브라우저가 null인 시점= 사용자가 인위적으로 삭제한 상태 이므로 최소한의 유효성검사 필요
      if(cks!=null){ //조건을 <=로 주면 안됨
    	for(int i=0;i<cks.length;i++){
    		//내가 필요한 정보인지 , 아닌지 확인하는 법= 쿠키 객체하나마다 이름이 있음 이름 가져오는 메소드 - getname
    		//lastday 내가 찾고 내가 저장하려는 값을 찾을때 라는 조건에 동일하다면 그 값 가져와
    		if(cks[i].getName().equals("lastDay")){
    			lastDay=URLDecoder.decode(cks[i].getValue());
    					//사용자의 컴퓨터에 저장되어있음
    		}
    		if(cks[i].getName().equals("popupck")) {
    			popupck="on"; //5. on이라는 데이터 있냐 없냐는 차이로 onload로 openpup()함수 열지 말지 결정
    		}
    	}
      }
      %>
  <!-- <body onload="openPopup()"> <!-- 1. 함수 호출 --> 
<body <%= popupck == null ? "onload='openPopup()'" : "" %>>
<%@include file="header.jsp" %>
   <hr>
   <section>
      <article id="mainImg">
        <img src="img/Dolphin.jpg" alt="메인이미지">
      </article>
      <article id="mainSubmenu">
      
      <!-- ------------------------------------------------------------- -->

      
      
      <h2><%=lastDay %></h2>
      <!-- ------------------------------------------------------------- -->
      <% //20250302 쿠키 설정
      Calendar now=Calendar.getInstance();
      int y=now.get(Calendar.YEAR);
      int m=now.get(Calendar.MONTH)+1;
      int d=now.get(Calendar.DATE);
      
      String str="마지막 접속일:"+y+"년"+m+"월"+d+"일";
      ///인코딩기능을 이용해 유니코드로 바꿔줄거임
      str=URLEncoder.encode(str);
      //1.객체생성
      Cookie ck=new Cookie("lastDay",str);
      //2.나이이정
	  ck.setMaxAge(60*60*24*30); //한달이라는 시간을 줌  
      //3.사용자 심기  //add로 쿠키저장
      response.addCookie(ck);
      //현재 시간이 저장 시간 전에 사용해야됨 안그럼  시간이 현재시간이 되니까?
      
      %>
      
      <!-- --------------------------------------------------------------- -->
         <h2>아래에 계속 추가됨</h2>
         <ul>
            <li><a href="member/memberFind.jsp">회원검색</a></li>
            <li><a href="formTest.jsp"> form테스트</a></li>
            <li><a href="cal.jsp">사칙연산 계산기</a></li>
            <li><a href="emp.jsp">사원관리프로그램 (원시형)</a></li>
            <li><a href="emp/emp2.jsp">사원관리 프로그램(Beans방식)</a></li>
			<li><a href="fileUploadTest.jsp">파일 업로드 테스트</a></li>
			<li><a href="filebbs/fileBbs.jsp">심플 자료실</a></li>
			<li><a href="gallery/imgGallery.jsp">이미지 갤러리</a></li>
         </ul>
      </article>
   </section>
<%@include file="footer.jsp" %>
</body>
</html>