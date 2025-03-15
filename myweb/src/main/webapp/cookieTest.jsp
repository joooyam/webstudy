<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.net.*" %> <!-- 인코딩을 도와주는 클래스 제공 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250312 쿠키 수업</title>
</head>
<body>
<h1>250312 cookieTest.jsp</h1>

<%
//1. 쿠키[들]가져오기
Cookie cks[]=request.getCookies();
//2. 쿠키요소에 접근해서 키값을 확인

if(cks!=null){
	for(int i=0; i<cks.length; i++){
		String key=cks[i].getName();
	//3.값 취득
		//String value=cks[i].getValue();
		String value=URLDecoder.decode(cks[i].getValue());
		
		out.println("<h3>key:"+key+"/value:"+value+"</h3>"); //사용하지 않은 데이터 js섹션id
	}
}
%>


 
<!-- 쿠키 저장하기 -->
   <%
   //<쿠키저장하기>
   //1. 쿠키 객체 생성
   
   String str = "홍 길동"; //2바이트 문자를 가져오는 법
   str = URLEncoder.encode(str);
   
   Cookie ck = new Cookie("username",str); //-> 서버에서 제공하는 것이므로 서버가 없으면 사용 못함
   
   //2. 쿠키 나이 지정 -> 살만큼의 나이 지정
   ck.setMaxAge(60*3); // -> 3분의 시간 지정
   
   //3. 사용자 컴퓨터에 심기 
   response.addCookie(ck);
   
   //쿠키는 원하는 만큼 객체를 만들어서 저장 가능
   Cookie ck2 = new  Cookie("userage","20");
   ck2.setMaxAge(60*3);
   response.addCookie(ck2);
   %>
</body>
</html>



