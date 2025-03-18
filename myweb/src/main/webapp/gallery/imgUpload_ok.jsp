<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.oreilly.servlet.*" %>  <!-- jsp useben이 마지막 -->
<jsp:useBean id="idao" class="com.yong.gallery.GalleryDAO"></jsp:useBean>
<%
String savepath=request.getRealPath("/gallery/imgs");

//250318

//10메가,인코딩방식 저장
MultipartRequest mr=
new MultipartRequest(request,savepath,1024*1024*10,"utf-8",new DefaultFileRenamePolicy());// 업로드할 때 같은 이름의 파일이 있을 떄 파일 기준!!!!!!!
//중복된 파일 있으면 덮어쓰지 말고 중복되지 않도록 지정하기 = new DefaultfileRename클래스의 객체를 매개값으로 주면 파일 뒤에다가 인덱스 부여해서 다른 값으로 됨 =대신 자동
//그래서 원본파일 이름, 변경된 파일 이름 모두 알아야됨

String writer=(String)session.getAttribute("sid"); //아이디로 가져옴
int result=idao.imgAdd(writer, mr);
String msg=result>0?"이미지 업로드 완료!":"이미지 업로드 실패!";

//이미지 관리하는 폴더 imgs= 저장경로로 하기 
//경로는 사람마다 다름 workspace,c,d,모두 다름 해결방법 = 다른 사람이 내 코드가 돌아가게 만드는 코드
//jsp 전반적인 정보 requestTest.jsp 에서 프로젝트 절대 (실제 경로)
//c부터 시작하는 주소 : myweb까지를 절대 경로로 얻어올 수 있음
//어떤 사용자가되든(어디서부터 시작되든) 절대경로 얻어올 수 있음 =//String savepath=request.getRealPath("/gallery/imgs");
%>

<script>
window.alert('<%=msg%>');
location.href='imgGallery.jsp';
</script>




