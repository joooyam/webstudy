<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<jsp:useBean id="wf" class="com.yong.wf.WebFolderDAO" scope="session"></jsp:useBean>>

<% 
// 250320 3. 탐색기 파일 업로드 성공함
String savepath=wf.getBasepath()+"/"+wf.getCrpath();//유저아이디까지의 경로지정해줌+wf.getUserid(); - 변경함 wf.getCrapath();
MultipartRequest mr=  //두번째는 업로드할 경로(기준은 사용자 아이디 = 정보는 웹폴더 객체에 저장해놓음)
	new MultipartRequest(request,savepath,(int)wf.getFreesize(),"UTF-8"); //업로드할 수 있는 용량이 INT로 되어있지만 8롭터 가져오는 건String이라 다운
//밑에 업로드 됐다면 스크립트 열어서 결과 나오도록
%>
<script>
window.alert('파일 업로드 성공!');  
opener.location.href='webfolder.jsp?crpath=<%=wf.getCrpath()%>';


//방법 2.나를 열었던 오프너에 로케이션 객체를 넣어서 하이퍼 레퍼런스 이용해 웹폴더 jsp로 다시 접속해
window.self.close(); //업로드한 후에 탐색기 결과 나오게 하려면 서버에 다시 요청해서 변경된 사항에 대해 다시 응답해달라고 해야됨
//방법 1. 나를 열었던 오프너 기능으로 위로드 라는 기능으로 f5누른 효과 나오도록 하기
</script>
