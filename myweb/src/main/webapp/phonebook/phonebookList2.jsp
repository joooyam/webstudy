<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.*" %>
    <%@ page import="com.yong.phonebook.*" %>
    <jsp:useBean id="pado" class="com.yong.phonebook.PhonebookDAO"></jsp:useBean>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 250311 </title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>모든 전화번호 내역 part2</h2>
		<table border="1" width="550">
			<thead>
				<tr>
					<th>번호</th>
					<th>이름</th>
					<th>전화번호</th>
					<th>주소</th>
				</tr>
			</thead>
			<tbody>
			<% //arr를 pdao로부터 formㅣ
			ArrayList<PhonebookDTO> arr=pado.phoneListPart1();
			if(arr==null || arr.size()==0){
				%>
				<tr>
					<td colspan="4">
					등록된 전화번호가 없습니다.
					</td>
				</tr>
				<%
				
			}else{
				for(int i=0; i<arr.size(); i++){
					%>
					<tr>
						<td><%=arr.get(i).getIdx() %></td>
						<td><%=arr.get(i).getName() %></td>
						<td><%=arr.get(i).getTel() %></td>
						<td><%=arr.get(i).getAddr() %></td>
					</tr>
					<%
				}
			}
			%>
			</tbody>
		</table>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>