package com.yong.member;

import java.util.*;
import java.sql.*;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {

	}

	public void dbConnect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리에 로딩
			String url = "jdbc:oracle:thin:@localhost:1521:xe";
			String user = "scott";
			String pwd = "1234";
			conn = DriverManager.getConnection(url, user, pwd);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
			} catch (Exception e2) {
			}
		}
	}

	/** 회원가입 관련 메서드 */
	public int memberJoin(MemberDTO mdto) {

		try {
			dbConnect();
			String sql = "insert into jsp_member values(jsp_member_idx.nextval," + "?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getId()); // dto로부터 getId가져옴
			ps.setString(2, mdto.getPwd());
			ps.setString(3, mdto.getName());
			ps.setString(4, mdto.getEmail());
			ps.setString(5, mdto.getTel());
			ps.setString(6, mdto.getAddr());
			int count = ps.executeUpdate(); //결과 리턴해주면 비즈니스 로직 끝
			return count; //리턴

		} catch (Exception e) {
			e.printStackTrace();
			return -1; //무언가가 잘못됐을 경우 양수만 아니면 되므로 -1 넣어서 무언가 잘못됐다고 알려줌
		} finally {
			try {
				if (ps != null) ps.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
	}
	
	/**아이디 중복검사 관련 메서드*/
	public boolean idCheck(String userid) {
		try {
			dbConnect();
			String sql = " select * from jsp_member where id=?"; //조회된 데이터가 있냐 없냐가 중요
			//id로 검색(검사)아이디 가져올거임
			
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery(); //있냐 ,없냐 판단하므로 데이터 가져올 필요없음//result에 물어보기만 하먄됨
			return rs.next(); //데이터 있냐 있으면 true, 없으면 false가 자동으로 돌아감
		} catch (
		Exception e) {
			e.printStackTrace();
			return false;	//중복검사했을 때 통과될 수 있도록 false로 함
		} finally {
			try {

				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {}
		}
	}
}

