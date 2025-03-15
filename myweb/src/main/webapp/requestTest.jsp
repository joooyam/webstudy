<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <!-- 250228 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>requestTest.jsp</h1>
<h3>사용자 IP:<%=request.getRemoteAddr() %></h3>
<h3>사용자 포트 : <%=request.getRemotePort() %></h3>
<h3>사용 프로토콜 : <%=request.getProtocol() %></h3>
<h3>접속 방식 : <%=request.getMethod() %></h3> <%//사용자가 get으로 접속하면 get으로 뜨고 post으로 뜨면 post로 %>
<h3>서버 서비스IP: <%=request.getServerName() %></h3>
<H3>서버 서비스 포트 :<%=request.getServerPort() %></H3>
<h3>서버 프로젝트 명:<%=request.getContextPath() %></h3>
<h3>사용자 접속 페이지 : <%=request.getRequestURI() %></h3>
<h3>프로젝트 절대(실제)경로 : <%=request.getRealPath("/") %></h3>
</body>
</html>