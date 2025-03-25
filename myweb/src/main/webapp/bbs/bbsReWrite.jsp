<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>!!!! 250325 답변형 게시판!!</title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css"><!--상대결로-->
</head>
<%
String title=request.getParameter("title"); //제목 받아옴 contents에서 //형변환도 필요없음
String ref=request.getParameter("ref");
String lev=request.getParameter("lev");
String sunbun=request.getParameter("sunbun");
%>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
	<h2>자유게시판 답변쓰기</h2>
	<form name="bbsReWrite" action="bbsReWrite_ok.jsp"><%//보이지 않게 hidden으로 해줌 %>
	<input type="hidden" name="ref" value="<%=ref %>">
	<input type="hidden" name="lev" value="<%=lev%>">
	<input type="hidden" name="sunbun" value="<%=sunbun%>">
	
	
	<fieldset>
		<legend>글쓰기</legend>
		<table>
			<tr>
				<th>작성자</th>
				<td><input type="text" name="writer"></td>
				<th>비밀번호</th>
				<td><input type="password" name="pwd"></td>
			</tr>
			<tr>
				<th>제목</th>
				<td colspan="3">
					<input type="text" name="title" size="45" value="RE:) <%=title%>">
				</td>
			</tr>
			<tr>
				<td colspan="4">
				<textarea rows="8" cols="45" name="content"></textarea>
				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="submit" value="글쓰기">
					<input type="reset" value="다시 작성">
				</td>
			</tr>
		</tbody>
		</table>
	</fieldset>
	</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>