<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@ page import="com.yong.member.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
	<jsp:useBean id="mdao" class="com.yong.member.MemberDAO"></jsp:useBean>
	<%
	request.setCharacterEncoding("utf-8");
	String fkey = request.getParameter("fkey");
	String fvalue = request.getParameter("fvalue");

	ArrayList<MemberDTO> arr = mdao.memberFind(fkey, fvalue);
	%>
	<table border="1" width="550">
		<thead>
			<tr>
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>E-mail</th>
				<th>전화번호</th>
				<th>가입날짜</th>
			</tr>
		</thead>
		<tbody>
			<%
			if (arr == null || arr.size() == 0) {
			%>
			<tr>
				<td colspan="6">검색된 회원이 없습니다.</td>
			</tr>
			<%
			} else {
			for (int i = 0; i < arr.size(); i++) {
			%>
			<tr>
				<td><%=arr.get(i).getIdx()%></td>
				<td><%=arr.get(i).getId()%></td>
				<td><%=arr.get(i).getName()%></td>
				<td><%=arr.get(i).getEmail()%></td>
				<td><%=arr.get(i).getTel()%></td>
				<td><%=arr.get(i).getJoindate()%></td>
			</tr>
			<%
			}
			}
			%>

		</tbody>
	</table>
</body>
</html>