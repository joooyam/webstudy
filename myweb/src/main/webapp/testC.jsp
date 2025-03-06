<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!-- 250227 JSP -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<H1>이것은 HTML태그에 작성된 문장입니다.</H1>
<!-- 이것은 HTML 주석입니다. -->
<!-- 자바 코드 작성방법 
1. < 꿜괄호 % 로 시작하고 > 닫기


400단 :클라이언트 내에서 발생한 오류
404없는 페이지에 접속할 때 나타나는 오류
403접근하면 안되는 곳에 접근시도 했을 때 오류
500단 서버 내에서 발생한 오류 (대부분의 오류코드 - 보통 내가 쓴 코드 오류문제임)
자바코드로 인
-->
<%//이곳은 자바코드를 작성할 수 있는 영역//
//한줄 주석
/*여러줄 주석*/
/**문서화 주석**/

System.out.println("이것은 자바코드로 작성한 문자열 ~");
//브라우저에 출력되지 않고 콘솔창에서 실행됨 즉, 변수도 생성가능

String str="java"; //지역변수 (%로 시작하는 것은 서비스 메소드 내에 삽입되므로 선언된것 지역변수가 됨)
System.out.println("str="+str);
// printlnWriter는 getWriter로 제공받은 것
 //기본객체 중 출력을 담당하는 것 
// out : servlet 에서 제시한 PrintWriter 객체
//jsp에서 제공되는 기본객체
out.println("<h2>이것은 자바코드로 문자열 !!!<h2>"); //out객체 사용해 출력(브라우저에 실행됨)
out.println("<h2>str="+str+"</h2>");

//값만 기능적으로 출력하는 태그
%>

<h2>str=<%=str%></h2>  

<%! //   !사용  클래스 내부에 삽입됨

//멤버 메소드
public int getSumNum(int num1,int num2) {
   int result=num1+num2;
   return result;
}
// 멤버변수
String str="js";
%>

<%
out.println("<h2>3+5="+getSumNum(3,5)+"</h2>");
%>
<!--//결과값만 출력하고 싶으면-->
<h2>4+6=<%=getSumNum(4,6) %></h2>


<h2>str=<%=str %></h2> <!-- 지역변수로 출력 -->

<h2>str=<%=this.str %></h2> <!-- 멤버변수로 출력 -->

<%
Calendar now=Calendar.getInstance();
int y=now.get(Calendar.YEAR);
int m=now.get(Calendar.MONDAY)+1;
int d=now.get(Calendar.DATE);

out.println("<h2>"+y+"년 " +m+"월 "+d+"일</h2>");


%>

</body>
</html>




