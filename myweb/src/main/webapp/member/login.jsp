<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 250314 </title>

<!--  250314  -->
<style>
li{
	list-style-type: none;
}

label{
 	width:90px;
 	float:left;
}
div {
	text-align:right;
}

</style>
</head>
<%
String saveid=""; //빈 문자열로 셋팅

/** 컴퓨터는 절차지향이라 절차만 제대로 잡아도 반은 감 */
Cookie cks[]=request.getCookies();
//그냥 사용하면 안됨쿠키에 대한 배열이 0이 아닐때만 사용해야됨
if(cks!=null){
	for(int i=0; i<cks.length; i++){
		//쿠키에 대한 배열 요소중 키 값을 가져와서 saveid라는게 있어? 하고 물음
		if(cks[i].getName().equals("saveid")){
			saveid=cks[i].getValue();
		}
	}
}

%>
<body>
<form name="login" action="login_ok.jsp" method="post">
<fieldset>
	<legend>login</legend>
	<ul>     <!-- 사용자의 일회성 정보를 받으므로 dto받을 필요 없음 -->
		<li><label>ID</label>
		<input type="text" name="userid" value="<%=saveid%>" ></li>
		<li><label>PWD</label>
		<input type="text" name="userpwd"></li>
	</ul>
	<div>
	<input type="checkbox" name="saveid" value="on"
	<%=saveid.equals("")?"":"checked" %>>ID 기억하기 <!-- value값 on이라고 하는 이유 -->
	<input type="submit" value="LOGIN">
	</div>
</fieldset>
</form>
</body>
</html>