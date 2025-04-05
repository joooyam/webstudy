<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>250311</title>
<link rel="stylesheet" type="text/css" href="../css/mainLayout.css">
</head>
<body>
	<%@include file="../header.jsp"%>
	<section>
		<article>
			<h2>모든 전화번호 내역 part1</h2>
			<table border="1" width="550">
				<thead>
					<tr>
						<th>번호</th>
						<th>이름</th>
						<th>전화번호</th>
						<th>주소</th>
					</tr>
				</thead>
				<!-- tbody부터 비즈니스 로직 -->
				<tbody>
					<%
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리에 로딩
	        String url = "jdbc:oracle:thin:@localhost:1521:xe";
	        String user = "scott";
	        String pwd = "1234";
	        Connection conn = DriverManager.getConnection(url, user, pwd);//실행 후 결과 돌려줌
	        //select 조회된 결과를 반영하는 것
	        String sql="select * from phonebook order by idx desc";
	        PreparedStatement ps=conn.prepareStatement(sql);
	        ResultSet rs=ps.executeQuery(); //resultset으로 결과 반환
	       
	        if(rs.next()){ 
	        	//너 데이터있니 
	        	//if문으로 조건주는 것은 do while 이용하기
	        	do{
	       	%>
					<tr>
						<td><%=rs.getInt("idx") %></td>
						<td><%=rs.getString("name") %></td>
						<td><%=rs.getString("tel") %></td>
						<td><%=rs.getString("addr") %></td>
					</tr>
			<%
	        	}while(rs.next());
	        } else {
	       	%>
					<tr>
						<td colspan="4">
						등록된 전화번호가 없습니다.
						</td>
					</tr>
			<%
	      	  }
			%>
				</tbody>
			</table>
		</article>
	</section>
	<%@include file="../footer.jsp"%>
</body>
</html>