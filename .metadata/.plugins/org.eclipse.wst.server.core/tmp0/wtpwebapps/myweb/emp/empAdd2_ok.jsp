<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- 250305 -->
<%
//재인코딩 //
request.setCharacterEncoding("UTF-8");
%>


<!-- 보여줄 거 아니므로 처음 보여주는 jsp 태그들 삭제함 -->
<jsp:useBean id="edto" class="com.yong.emp.EmpDTO"></jsp:useBean>
<jsp:setProperty property="*" name="edto"/> <!-- 여기에서 post방식은 요청을 하면서부터 파라미터가 깨짐 - 꺠져있는 것을 카트에 넣은 것 -->
<jsp:useBean id="edao" class="com.yong.emp.EmpDAO"></jsp:useBean>
<%
int result=edao.empAdd(edto); //행위만을 위임받아서 결과에 대한 처리할 필요 x //결과에 대한 처리는 징검다리 _ok가 해줌 (결과를 받아서=result) 
String msg=result>0?"사원등록성공(beans)":"사원등록실패(beans)";
//이동을 많이해서 다 따라다니면서 봐야하지만 코드가 간결함 (한눈에 보임)
%>
<script>
window.alert('<%=msg%>');
location.href='emp2.jsp';
</script>