package com.yong.member;

import java.util.*;
import java.sql.*;

///250307
public class MemberDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	// 상수는 변하지 않는 값에 누구나 접근 가능하고 언제나 메모리에 들어가야됨(static) //년도가져올때 calendar에 1을 기억하는게
	// 아니라 calendar에 값을 넣어서
	// 250314 25분 녹음 다시듣기
	// int 정수를 저장하는 NOT_ID=1; //1이라는 값을 계속 활용할 수 있다는 의미?
	public static final int NOT_ID = 1;
	public static final int NOT_PWD = 2; // 글자만 보면되니까 1, 2 둘다 기억안해도됨
	public static final int LOGIN_OK = 3;
	public static final int ERROR = -1; // 이걸 보고 바로 에러구나 확인가능하니까 상수를 만들고 Return -1해도 아이디가 없다라면 하고 이해가능해짐

	//

	public MemberDAO() {

	}

//   public void dbConnect() {
//      try {
//         Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리에 로딩
//         String url = "jdbc:oracle:thin:@localhost:1521:xe";
//         String user = "scott";
//         String pwd = "1234";
//         conn = DriverManager.getConnection(url, user, pwd);
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         try {
//         } catch (Exception e2) {
//         }
//      }
//   }

	/** 회원가입 관련 메서드 */
	public int memberJoin(MemberDTO mdto) {

		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_member values(jsp_member_idx.nextval," + "?,?,?,?,?,?,sysdate)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, mdto.getId()); // dto로부터 getId가져옴
			ps.setString(2, mdto.getPwd());
			ps.setString(3, mdto.getName());
			ps.setString(4, mdto.getEmail());
			ps.setString(5, mdto.getTel());
			ps.setString(6, mdto.getAddr());
			int count = ps.executeUpdate(); // 결과 리턴해주면 비즈니스 로직 끝
			return count; // 리턴

		} catch (Exception e) {
			e.printStackTrace();
			return -1; // 무언가가 잘못됐을 경우 양수만 아니면 되므로 -1 넣어서 무언가 잘못됐다고 알려줌
		} finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 아이디 중복검사 관련 메서드 */
	public boolean idCheck(String userid) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = " select * from jsp_member where id=?"; // 조회된 데이터가 있냐 없냐가 중요
			// id로 검색(검사)아이디 가져올거임

			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery(); // 있냐 ,없냐 판단하므로 데이터 가져올 필요없음//result에 물어보기만 하먄됨
			return rs.next(); // 데이터 있냐 있으면 true, 없으면 false가 자동으로 돌아감
		} catch (Exception e) {
			e.printStackTrace();
			return false; // 중복검사했을 때 통과될 수 있도록 false로 함
		} finally {
			try {

				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	}

	/** 회원 검색 관련 메서드 */

	// 멤버dto에 대한 배열 받기
	public ArrayList<MemberDTO> memberFind(String fkey, String fvalue) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_member where " + fkey + "=?"; // 인파마리터는 value에 한해어삼 ㄴ사용가능함 해당 컬럼에 대해서는 값 바꿀
																			// 수 없음
			// 컬럼명은 뭐 해서 섞어쓺
			ps = conn.prepareStatement(sql);
			ps.setString(1, fvalue);
			rs = ps.executeQuery();
			ArrayList<MemberDTO> arr = new ArrayList<MemberDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String id = rs.getString("id");
				String pwd = rs.getString("pwd");
				String name = rs.getString("name");
				String email = rs.getString("email");
				String tel = rs.getString("tel");
				String addr = rs.getString("addr");
				java.sql.Date joindate = rs.getDate("joindate");// sql패키지에서 가져옴 자료형 명시
				MemberDTO dto = new MemberDTO(idx, id, pwd, name, email, tel, addr, joindate);
				arr.add(dto);

			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}

		}
	}

	/** 250314 로그인 검증 관련 메서드  */
	public int loginCheck(String userid, String userpwd) {
		try {
			conn = com.yong.db.YongDB.getConn();
			// 1. 로그인 할 때 조회되냐/ 안되냐 기준으로 아이디 존재 유무 확인 (아이디, 비밀번호 모두 가져올 필요 없음 )
			// 2. pwd 만 가져오면 됨
			String sql = "select pwd from jsp_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			if (rs.next()) {
				String dbpwd = rs.getString("pwd");
				if (dbpwd.equals(userpwd)) {
					return LOGIN_OK; // 맞다면 상수값 돌려줄 수 있고
					// 아니라면 not pwd돌려줄 수 있도록

				} else {
					return NOT_PWD;
				}
			} else {
				return NOT_ID; // 아이디가 없구나 라고 생각 가능해짐 다른 개발자가
			}
		} catch (Exception e) {
			return ERROR; // 이건 에러상황 돌려주는 거
		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}
	} // 여기까지 비즈니스 로직으로 이제 판단하는 것이 필요 header - login - memberDAO
	// 로그인 성공하면 사용자 정보 갖올거임

	/** 250314 로그인 검증 후 사용자정보 취득관련 메서드 */
	public String getUserInfo(String userid) {
		try {
			conn = com.yong.db.YongDB.getConn();

			String sql = "select name from jsp_member where id=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs = ps.executeQuery();
			rs.next();
			return rs.getString(1); //
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		} finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {}
		}
	}
}
