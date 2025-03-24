<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
// 총 게시물 수
int totalCnt = 56;//db로 부터 조회하는 것이 기본 //56개의 게시물
// 보여줄 리스트 수
int listSize = 5; //5개씩 보여주기 인위적으로 내 맘대로 적용
//보여줄 페이지 수
int pageSize = 5;
//사용자의 현재 위치
//이렇게 한,, 이유가 있음 !!!!! 물어보기!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!1
String cp_s = request.getParameter("cp");
if (cp_s == null || cp_s.equals("")) {
	cp_s = "1";
}
int cp = Integer.parseInt(cp_s);

//int cp=11;
//시작하는 위치를 사용자의 현재 위치로 변경하게 하도록 함?? 

// 총 페이지 수
int totalPage = (totalCnt / listSize) + 1; //공식 / ㄴ딱 나눠떨어질 땐 하나 많은 상황 발생하므로
if (totalCnt % listSize == 0)
	totalPage--;

//사용자가 어떤 그룹에 속해있는 지 확인
//사용자 속해있는 그룹(12345 or 678910 ... )
int userGroup = cp / pageSize; //딱 나눠떨어지면 하나가 더 생기는 상황이 생기므로 IF문 작성
if (cp % pageSize == 0)
	userGroup--; //나눠떨어지면 1개 빠질 수 있도록 함
%>
<body>
	<h1>250324 pageTest.jps</h1>
	<h3>
		총 게시물 수 :
		<%=totalCnt%>
	</h3>
	<h3>
		보여줄 리스트 수 :
		<%=listSize%></h3>
	<h3>
		총 페이지 수 :
		<%=totalPage%></h3>
	<h3>
		보여줄 페이지 수 :
		<%=pageSize%></h3>
	<h3>
		사용자의 현재 위치 :
		<%=cp%></h3>
	<hr>
	<%
	//현재 위치의 그룹은 사용자 기준이므로 사용자그룹을 기준으로 할 것
	if (userGroup != 0) {
	%>
	<a href="pageTest.jsp?cp=<%=(userGroup - 1) * pageSize + pageSize%>">&lt;&lt;</a>
	<%
	//&lt; &lt;
	}
	%>
	<%
	//페이지 수 1페이지부터 total페이지 가 총 페이지가 될 떄까지 증가
	//사용자가 위치하고 있는 곱하기 사용자가 보여줄 페이지 수 
	for (int i = (userGroup * pageSize + 1); i <= (userGroup * pageSize + pageSize); i++) { //페이지를 가고 싶다고 클릭한것이므로 페잊 넘길 때 cp파라ㅣㅁ터 넘김
	%>&nbsp;&nbsp;
	<a href="pageTest.jsp?cp=<%=i%>"><%=i%></a>&nbsp;&nbsp;
	<%
	if (i == totalPage) {//마지막 페이지와 같다면 페이지 돌지않도록 막기
		break;
	}
	}
	%>
	<%
	//마지막 그룹번호 아는 법
	//총페ㅣ지 수가 마지막 페이지라면 마지막 그룹변호 확인하면됨
	if (((totalPage / pageSize) - (totalPage % pageSize == 0 ? 1 : 0)) != userGroup) {
	%>
	<a href="pageTest.jsp?cp=<%=(userGroup + 1) * pageSize + 1%>">&gt;&gt;</a>
	<%
	} //cp기준을 그룹화해서 그걸로 해당페이지 이동ㅇ할 수 있도록
	%>




</body>
</html>