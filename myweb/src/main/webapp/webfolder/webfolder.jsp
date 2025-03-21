<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%//250318~19 사용자 정보 %>
<%@ page import="java.io.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250320</title>
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
    background-color : skyblue;
 }

meter{
   width: 250px;
}
</style>
<script>
function openUpload(){
	window.open('upload.jsp','upload','width=500,height=250');
}

function openUploadFol(){
	window.open('uploadFol.jsp','uploadfol','width=500, height=250');
}
</script>
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
wf.setBasepath(request.getRealPath("/webfolder/upload"));//myweb까지의 절대 경로 가져오고webfolde폴더에upload라는 폴더까지 경로로 할게
wf.setUserid(sid);
wf.userFolderExists(); //메서드 호출하면 폴더 만들 수 있게 됨
//250320 현재 경로가 아무것도 없으면 사용자의 아이디가 그냥 기본 default값이 됨
//1. 폴더 안 폴더 들어가는 경로로 가는 법 순서:
//이 getParameter로 crapth를 받아서 if문으로 조건주면 aaa클릭 선택만 가능하도록 되어있던게 실제 폴더 안의 폴더로 들어갈 수 있도록 할 수 있게 됨

String crpath=request.getParameter("crpath");
if(crpath==null || crpath.equals("")){
	crpath=sid;
}
//wf.setCrpath(sid); //기본값 가지고 있다할떄
wf.setCrpath(crpath);
%>
<body>
<%@include file="/header.jsp" %>
<section>
   <article class = "darticle"> <!-- darticle>/? -->
      <h2>Y 드라이브</h2>
      <fieldset>
         <legend>사용정보</legend>
         <ul>   <!--새로고침하면 사용용량이 계속 늘어나게됨 사용용량을 생성자에서 초기화해줌 객체는 1번 만들어지면 USE.FREE는 초기화 1번해줌 -->
            <li><label>총 용량 :</label> 
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
         <input type = "button" value = "파일 올리기" onclick="openUpload();">
         <input type = "button" value = "폴더 만들기" onclick="openUploadFol();">
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
            <tbody>
            <%
            // 상위 이동 메뉴 (현재 위치에서 마지막 슬러쉬까지 문자열 쪼개기) -  폴더 내부로 들어갔을 시에만
            //상위루트 아는 법= 내아이디까지 경로가 최상위루트
            //사용자 아이디 가지고 현재위치 표현하는 것이므로 이게 최상위루트라는 말
            //만약에 현재 위치가 사용자 이름과 현재위치가 같지 않다면? 으로 반전 시켜줌,,?,, ㅠ
            if(!wf.getCrpath().equals(wf.getUserid())){
            int endpoint=wf.getCrpath().lastIndexOf("/"); //2슬러쉬를 발생하는 위치까지 가져옴
            String up_cr=wf.getCrpath().substring(0,endpoint);
            %>
            <tr>
            	<td colspan="3">
           		<a href="webfolder.jsp?crpath=<%=up_cr%>" >상위폴더로...</a> 	
            	</td>
            </tr>	
            
            <%
            }
            //250320 1. 탐색기 파일 목록 불러오는 법
            File f=new File(wf.getBasepath()+"/"+wf.getCrpath()); //getUserid에서 바꿔줌
            File files[]=f.listFiles();
            
            if(files==null || files.length==0){
            	%>
            	<tr>
            		<td colspan="3" align="center">
            			등록된 파일 및 폴더가 없습니다.
            			</td>
            	</tr>
            <%
            }else {
            	for(int i=0; i<files.length; i++){
            		%>
            	<tr>
            		<td><%=files[i].isFile()? "[FILE]":"[DIR]" %></td>
            		<td>
            		<%
            		if(files[i].isFile()){//현재 경로에 새로운이동하고자하는 폴더 정보를 보여줌 하단에 링크 보여줌
            			%>
            			<a href="/myweb/webfolder/upload/<%=wf.getCrpath()%>/<%=files[i].getName()%>"><%=files[i].getName() %></a>
            			<%
            		}else {
            			//클릭하면 webfolder.jsp로 파라미터 넘겨줌 (인위적으로 바꿔줌 처음 접속하면 없으므로 유효성검사 후
           				//crapth없으면 사용자 아이디로 셋팅 있으면 넘어온 경로로 셋팅하겠다 함)
           			//2. 폴더 안 폴더 들어가는 경로로 가는 법 순서여기서 crpath받아가지구 하는 건데 링크 줄에 개행하면 그 개행도 데이터로봐서 안들어가짐
            			%>
            			<a href="webfolder.jsp?crpath=<%=wf.getCrpath()%>/<%=files[i].getName()%>">
            			<%=files[i].getName()%></a><%
            		}
            		%>
  				</td>
  				<td><a href="fileDelete.jsp?target=<%=files[i].getName()%>">삭제</a></td>
            	</tr>
            	<%
            	}
            	
            }
            %>
            </tbody>
         </table>
      </fieldset>
   </article>
</section>
<%@include file="/footer.jsp" %>
</body>
</html>