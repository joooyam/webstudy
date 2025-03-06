<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*" %>
<%
/////250304
String idx_s=request.getParameter("idx"); //널 불어본 다음 같은 상황물어보는 게 일반적
if(idx_s==null||idx_s.equals("")){
   idx_s="0";
}
int idx=Integer.parseInt(idx_s);
//in문 써도 되고 if else해도 상관없는데
//자바와 자바스크립트가 동일선상에 있었을 ㄸ 같은 맥락 흐름으로 번역됐을 때 자바와 자바스크립트는 각자 다르게 번역됨
//자바 읽고 자바스크립트 읽고 html번역되는 것
Class.forName("oracle.jdbc.driver.OracleDriver");
String url="jdbc:oracle:thin:@localhost:1521:xe";
String user="scott";
String pwd="1234";
Connection conn=DriverManager.getConnection(url,user,pwd); //연결자 받아옴  url,user,,을 기입하면 conn에 받아올 수 있음
String sql="select * from employee2 where idx=?";
PreparedStatement ps=conn.prepareStatement(sql);
ps.setInt(1, idx);
ResultSet rs=ps.executeQuery(); //검사하고 난 이후에 즐겨찾기 해버리면 db에 조회된 걸 토대로 있냐없냐를 확인해야됨
if(!rs.next()){   //없다라면 if문 수행할 수 있도록 함 //커서가 이미 데이터가 있는 곳으로 있으므로 데이터 출력만 하면됨
%>
<script> 
window.alert('잘못된 접근 또는 삭제된 사원입니다.'); 
location.href='emp.jsp';
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
<link rel="stylesheet" type="text/css" href="css/mainLayout.css">
</head>
<body>
<%@include file="header.jsp"%>
<section>
   <article>
      <h2><%=rs.getInt("idx") %>번의 사원정보 수정</h2>
      <form name="empUpdate" action="empUpdate_ok.jsp">
      <input type="hidden" name="idx" value="<%=rs.getInt("idx")%>">
         <table>
            <tr>
               <th>사원번호</th>
               <td><%=rs.getInt("idx")%></td>   
            </tr>
            <tr>
               <th>사원이름</th>
               <td><input type="Text" name="name" value="<%=rs.getString("name")%>"></td>   
            </tr>
            <tr>
               <th>E-mail</th>
               <td><input type="Text" name="email" value="<%=rs.getString("email")%>"></td>   
            </tr>   
            <tr>
               <th>부서명</th>
               <td><input type="Text" name="dept" value="<%=rs.getString("dept")%>"></td>   
            </tr>
            <tr>
               <td colspan="2" align="center">
                  <input type="submit" value="정보수정">
                  <input type="button" value="취소하기" onclick="location.href='emp.jsp'">
               </td>
            </tr>
         </table>
      </form>
   </article>
</section>
<%@include file="footer.jsp"%>
</body>
</html>