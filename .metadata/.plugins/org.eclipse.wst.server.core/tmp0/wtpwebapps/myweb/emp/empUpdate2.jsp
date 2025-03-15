<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yong.emp.*"%>
 <!-- 기능을 가지고 있는 객체를 가지고와야하니까?? usebean가져옴 -->
 <jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean>
 <%
 String idx_s=request.getParameter("idx");
 //자바스크립트에서 유효성 검사해주는 거고 처음 간단한 유효성 검사할거임
 if(idx_s==null || idx_s.equals("")){
    //빈 문자열과 같앋면 0으로 초기화할거야
    idx_s="0";
}
 int idx=Integer.parseInt(idx_s);
 
 EmpDTO dto=edao.empUpdateSel(idx);
 
 //empdto가 null과 같다면 나 중지할거야
 //잠시 열어서 사용자에게 응답할 수 잇도록 자바스크립트 쓸거임
 if(dto==null){
    %> 
    <script>
    window.alert(' 잘못된 접근 또는 퇴사한 사원입니다.');
    location.href='emp2.jsp';
    </script>
 <% 
    return;
 }
 %>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css"> 
</head>
<body>
<%@include file="../header.jsp" %> <!-- 절대경로 java는 서버로 부터 시작하므로 myweb으로부터 시작..? -->
<section>
   <article>
      <h2><%=dto.getIdx()%>사번의 사원 정보 수정</h2>
      <form name="empUpdate2" action=empUpdate2_ok.jsp>
      <input type="hidden" name="idx" value="<%=dto.getIdx()%>">
      <table>
            <tr>
               <th>사원번호</th>
               <td><%=dto.getIdx()%></td>   
            </tr>
            <tr>
               <th>사원이름</th>
               <td><input type="Text" name="name" value="<%=dto.getName() %>"></td>   
            </tr>
            <tr>
               <th>E-mail</th>
               <td><input type="Text" name="email" value="<%=dto.getEmail() %>"></td>   
            </tr>   
            <tr>
               <th>부서명</th>
               <td><input type="Text" name="dept" value="<%=dto.getDept()%>"></td>   
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="정보수정">
                  <input type="button" value="취소하기" onclick="location.href='emp2.jsp'"> 
               </td>
            </tr>
         </table>
      </form>
   </article>   
</section>
<%@include file="../footer.jsp" %>
</body>
</html>