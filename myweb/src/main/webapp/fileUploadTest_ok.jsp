<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%
String savepath="c:/java_student/uploadTest";

int filesize=1024*1024*10; //1키로 바이트=1024 이므로 1024*1024=1메가

//객체 생성 //첫번쨰값으로 리퀘스트 쓰면 모든 정보가 multipar로 가게됨..?20250314 35분
MultipartRequest mr=
	new MultipartRequest(request,savepath,filesize,"utf-8"); 
//업로드 한 이후 form페이로 이동할 수 있도록
//용량 10메가 제한 하고 싶을때
%>
<script>
alert("업로드 ok~");
location.href="fileUploadTest.jsp";
</script>