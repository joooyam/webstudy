<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%// 원시형으로 구현  250311 @@%>
<%@ page import="java.sql.*" %>
<%
	//1. 사용자 값 회수
	String name=request.getParameter("name"); //파라미터 받아옴
	String tel=request.getParameter("tel");//리퀘스트객체로부터 파라미터 가져옴
	String addr=request.getParameter("addr");
	

	//2. DB연동 (DB에서 가져오기 위한 )
	Class.forName("oracle.jdbc.driver.OracleDriver");
	String url="jdbc:oracle:thin:@localhost:1521:xe";
	String user="scott";
	String pwd="1234";
	Connection conn=DriverManager.getConnection(url,user,pwd);

	//3.insert (그럼 쿼리 필요) 폰북에서 갑 가져올건데 순차적으로 증가하는 값,대처되는 값 인파라미터로 대처
	String sql="insert into phonebook values(phonebook_idx.nextval,?,?,?)";
	PreparedStatement ps=conn.prepareStatement(sql);
	ps.setString(1, name);
	ps.setString(2,tel); //안착
	ps.setString(3, addr); //작성한 횟수로 state 반환됨
	int count=ps.executeUpdate();
	ps.close();
	conn.close(); 

	//4. 결과 사용자에게 응답
	//처리한 결과 판단할 수 있어야됨(if, else문도 있고 메세지로 판단 가능함)
	//0보다 크면 한번은 수행됨
	//1이 라면 등록, 아니면 0이므로 실패!
	String msg=count>0?"전화번호등록완료!":"전화번호등록실패";
	%>
	<script>
	window.alert('<%=msg%>');
	//로케이션이 가지고 있는 하이퍼로케이션을 이용해 phoneForm.jsp로 이동할 수 있도록
	location.href="phonebookForm.jsp";
	</script>




