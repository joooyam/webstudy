<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>
<jsp:useBean id="filedao" class="com.yong.filebbs.FileBbsDAO"></jsp:useBean>

<% // 250317 실습) 2.파일 처리하는 페이지   //슬러시가 제어문자로 생각하게 됨 컴퓨터가 그래서 기능이 있는 제어문자가 아니라고 알려주기 기능을 제거하기 위해 슬러시 하나 부탁하는 형식으로 하기
//그렇게 문자열 지정해주기
String savepath="C:/java_student/jspstudy/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/myweb/filebbs/files";
//savepath에 저장경로 저장 웹어플리케이션은 서비스 제공 myweb = 내 폴더
MultipartRequest mr=
	new MultipartRequest(request,savepath,1024*1024*10,"utf-8"); //생성자를 호출해 매개값을 request로 해주고 savepath를 두번째 매개값 + 용량 넣어야됨
//업로드할 때의 인코딩 방식 //"utf-8"//

String filename=mr.getOriginalFileName("upload");//입력태그 이름 기입해주면 업로드로 입력태그 파일 이름을 가져올게 하고 파일이름 가져옮
String writer=(String)session.getAttribute("sid");

int result=filedao.fileBbsUpload(filename, writer);
String msg=result>0?"파일 업로드 성공!":"업로드 중 오류발생!";
%>
<script>
window.alert('<%=msg%>');
location.href='fileBbs.jsp'; //파일정보가 multimpartrequest객체에 있는 겄!! 하나의 매개값으로 받아서 넘겨주는 방식으로 하기로함 개발자마다 다름 dao설명하는 것
//하나의 사이트에서 제공해주는 전혀다른 주제들
</script>