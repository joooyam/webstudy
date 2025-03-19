<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//250318~19 사용자 정보 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel ="stylesheet" type="text/css" href="/myweb/css/mainLayout.css">
<style>

fieldset{
   margin:10px;
}

.darticle h2{
   text-align: center;
   color : skyblue;
}

section li{
   list-style-type: none;
}

section label{
   width : 120px;
   float : left;
}

table{
   width : 550px;
   margin : 0px auto;
   border-top : 2px double #darkblue;
   border-bottom: 2px double #darkblue;
}

table th{
   background-color: #eeeeee;
}

meter{
   width: 250px;
}
</style>
</head>

<%
String sid =(String)session.getAttribute("sid");
if(sid==null){
%>
<script>
window.alert('로그인 후 이용 가능한 페이지입니다.')
location.href='/myweb/index.jsp';
</script>
<%
return;   
}
%>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>
<%//사용자가 로그아웃하거나 나갈 떄까지 사용  그래서 로그인 한 이후까지만 서비스 제공하므로 Session으로 제공해줌 주
wf.setBasepath(request.getRealPath("/webfolder/upload"));//myweb까지의 절대 경로 가져오고 webfOLDER라는 폴더에 UPLOAD라는 폴더까지 경로로 할게
wf.setUserid(sid);
wf.userFolderExists(); //메서드 호출하면 폴더 만들 수 있게 됨

%>
<body>
<%@include file="/header.jsp" %>
<section>
   <article class = "darticle">
      <h2>Y 드라이브</h2>
      <fieldset>
         <legend>사용정보</legend>
         <ul>
            <li><label>총 용량 :</label> <!--새로고침하면 사용용량이 계속 늘어나게됨 사용용량을 생성자에서 초기화해줌 객체는 1번 만들어지면 USE.FREE는 초기화 1번해줌 -->
            <meter max="<%=wf.getTotalsize() %>" min="0" value="<%=wf.getTotalsize() %>"></meter>
            (<%=wf.getTotalsize() %>)(byte)</li>
            <li><label>사용 용량 :</label>
            <meter max="<%=wf.getTotalsize() %>" min="0" value="<%=wf.getUsedsize()%>"></meter>
             (<%=wf.getUsedsize() %>)(byte)</li>
            <li><label>남은 용량 : </label>
            <meter max="<%=wf.getTotalsize() %>" min="0" value="<%=wf.getFreesize()%>"></meter>
             (<%=wf.getFreesize() %>)(byte)</li>
         </ul>
      </fieldset>
   </article>
   <article>
      <div>
         <input type = "button" value = "파일 올리기">
         <input type = "button" value = "폴더 만들기">
      </div>
      <fieldset>
         <legend>탐색기</legend>
         <table>
            <thead>
               <tr>
                  <th>구분</th>
                  <th>폴더 및 파일명</th>
                  <th>삭제</th>
               </tr>
            </thead>
         </table>
      </fieldset>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>