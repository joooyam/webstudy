<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.yong.bbs.*" %>
<jsp:useBean id="bdao" class="com.yong.bbs.BbsDAO" scope="session"></jsp:useBean>
<%
//객체를 통해 값을 반환받음 위에 bdao
String idx_s=request.getParameter("idx"); //주소창을 통해 넘겨지는 상황
if(idx_s==null || idx_s.equals("")){
	idx_s="0"; //유효성 검사
}
int idx=Integer.parseInt(idx_s);
BbsDTO dto=bdao.bbsContent(idx);
if(dto==null){
	//밑에 있는 기능이 수행하지못하도록 하기 조건에 맞다면
	%>
	<script>
	window.alert('삭제된 게시글 또는 잘못된 접근입니다.');
	loaction.href='bbsList.jsp';
	</script>
	<%//이걸통과하면 dto객체가 있다는 뜻
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250324 게시물 내용</title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css"><!--상대결로-->
</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>자유게시판 본문보기</h2>
		<fieldset>
			<legend>본문내용</legend>
			<table width="650" border="1" cellspacing="0">
				<tr>
					<th>번호</th>
					<td><%=dto.getIdx() %></td>
					<th>작성날자</th>
					<td><%=dto.getWritedate() %></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%=dto.getWriter() %></td>
					<th>조회수</th>
					<td><%=dto.getReadnum() %></td>
				</tr>
				<tr>
					<th>제목</th>
					<td colspan="3">
					<%=dto.getTitle() %>
					</td>
				</tr>
				<tr height="150">
					<td colspan="4" align="left" valign="top">
					<%=dto.getContent().replaceAll("\n","<br>")%></td>
				</tr>
				<tr>
					<td colspan="4" align="center">목록으로</td>
				</tr>
			</table>
		</fieldset>
	</article>
</section>
<%@include file="../footer.jsp" %>

</body>
</html>