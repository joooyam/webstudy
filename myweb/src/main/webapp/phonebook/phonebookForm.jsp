<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> 250311 </title>
<link rel = "stylesheet" type="text/css" href="../css/mainLayout.css">
<!-- 상대경로면 ../ -->

</head>
<body>
<%@include file="../header.jsp" %>
<section>
	<article>
		<h2>전화번호부 프로그램1</h2>
		<form name="phoneAdd1" action="phoneAdd1_ok.jsp">
		<fieldset>
			<legend>전화번호등록 part1</legend>
			<ul>
				<li><label>이름</label><input type="text" name="name"></li> 
				<li><label>전화번호</label><input type="text" name="tel"></li>
				<li><label>주소</label><input type="text" name="addr"></li>
			</ul>
			<div>
				<input type="submit" value="전화번호등록">
				<input type="reset" value="다시작성">
			</div>
		</fieldset>
		</form>
	</article>
	<article>
		<h2>전화번호부 프로그램2</h2>
		<form name="phoneAdd2" action="phoneAdd2_ok.jsp">
		<fieldset>
			<legend>전화번호등록 part2</legend>
			<ul>
				<li><label>이름</label><input type="text" name="name"></li> 
				<li><label>전화번호</label><input type="text" name="tel"></li>
				<li><label>주소</label><input type="text" name="addr"></li>
			</ul>
			<div>
				<input type="submit" value="전화번호등록">
				<input type="reset" value="다시작성">
			</div>
		</fieldset>
		</form>
	</article>
	<article>
		<h2>전화번호삭제 프로그램 1 (원시형) </h2>
		<form name="phoneDel1" action="phoneDel1_ok.jsp">
		<fieldset>
			<legend>전화번호 삭제 part1</legend>
			<table>
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="idx"></td>
					<td><input type="submit" value="회원번호 삭제"></td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
		<article>
		<h2>전화번호삭제 프로그램 2 (beans) </h2>
		<form name="phoneDel2" action="phoneDel2_ok.jsp">
		<fieldset>
			<legend>전화번호 삭제 part2</legend>
			<table>
				<tr>
					<th>회원번호</th>
					<td><input type="text" name="idx"></td>
					<td><input type="submit" value="회원번호 삭제"></td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
	<article>
		<fieldset>
			<legend>모든 전화번호 내역 part1 (원시형) </legend>
			<h3><a href="phonebookList1.jsp">모든 전화번호 내역 보기 part1</a></h3>
		</fieldset>
	</article>
	<article>
		<fieldset>
			<legend>모든 전화번호 내역 part2 (Beans) </legend>
			<h3><a href="phonebookList2.jsp">모든 전화번호 내역 보기 part2</a></h3>
		</fieldset>
	</article>
	<article>
		<h2> 전화번호 검색 </h2>
		<form name="phoneSearch" action="phoneSearch_ok.jsp">
		<fieldset>
			<legend>전화번호 검색 part1</legend>
			<table>
				<tr>
					<th>전화번호</th>
					<td><input type="text" name="idx"></td>
					<td><input type="submit" value="전화번호 검색"></td>
				</tr>
			</table>
		</fieldset>
		</form>
	</article>
</section>
<%@include file="../footer.jsp" %>
</body>
</html>