package com.yong.bbs;

import java.security.DrbgParameters.NextBytes;
import java.sql.*;
import java.util.*;

import org.apache.jasper.tagplugins.jstl.core.Catch;

// 250324

public class BbsDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public BbsDAO() {

	}

	
	/** 마지막 ref 구하기 관련 메서드 */ //ref는 int이므로 int로 반환값 줌
	public int getMaxRef() {
		try { //conn을 셋팅 안하는 이유는 글쓰기에서 이미 셋팅된 후 ref를 수행실 것 이므로 마지막에도 conn을 close안함 하게되면 이 메서드 수행 못함 
			String sql="select max(ref) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int ref=0; //변수 만들어서 0으로 초기화
			if(rs.next()) { //ref가 데이터가 있다면 1을 반환?
				ref=rs.getInt(1);
			}
			return ref;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close(); // conn을 close하면 ref가 conn을 받고 못하므로 순서대로 할려면 0이였던 것을 파라미터 받게 해서 셋팅
			}catch (Exception e2) {}
		}
	}
	
	
	
	
	
	
	/** 글쓰기 관련 메서드 */ // 정보들 dto에 담아서 사용하고 글쓰
	public int bbsWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			
			int ref=getMaxRef();//받고 있다라는 전제하에 하도록 함 마지막 ref구하기 관련 멧더드 작성할때 ㄴ이것부터 작성함
			
			String sql = "insert into jsp_bbs "
					+ "values(jsp_bbs_idx.nextval,?,?,?,?,"
					+ "sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, ref+1);// ref를 하나씩 증가 시키기위해서! 요게 1번째 규칙 ! (답변을 작성하는 기능부터 2번 규칙 ing)
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
	
	
	/** 답변 시 sunbun 업데이트 관련 메서드*/  //250325 답변 3규칙 실패했는지 안했는지 확인어려움 + 내가 들어가기 전에 업데이트 되어야됨
	public void setSunUpdate(int ref, int sun) {	//업데이트 할 대상이 없어서 0이 발생할 수 있음 
		//글쓰는 기행이 수행될때 이 sunbun업데이트 메소드 수행하고 싶음 그래서 conn굳이 안받음
		try {
			String sql="update jsp_bbs "
					+ "set sunbun=sunbun+1 "
					+ "where ref=? and sunbun>=?" ; //자가 연산
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sun);
			ps.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
			}catch (Exception e2) {
			
			}
		}
	}

	
	/**답변 글쓰기 관련 메서드*/ //250325 답변 2규칙 - 카트 bbsdto받음
	public int bbsReWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			
			///이 getsunbun은 본문글에 대한 순번이므로 +1로 해야지 ~
			setSunUpdate(dto.getRef(), dto.getSunbun()+1);
			
			String sql = "insert into jsp_bbs "
					+ "values(jsp_bbs_idx.nextval,?,?,?,?,"
					+ "sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			//getMaxRef는 ref를 그룹화하기 위해서 쓰였으므로 여기서는 쓰지 않음
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setInt(5, dto.getRef()); //동일하므로 그대로 가져옴
			ps.setInt(6, dto.getLev()+1); //LEV,sunbun은 1씩 증가하므로 1식 추가해줌 = 조건 충족해줌
			ps.setInt(7, dto.getSunbun()+1);
			int count=ps.executeUpdate();
			return count;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
				
			}catch (Exception e2) {
				
			}
		}
	}
	
	
	/**총 게시물 수 관련 메서드*/
	public int getTotalCnt() {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "select count(*) from jsp_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery(); //없으면 0이라는 숫자 
			rs.next();
			int count=rs.getInt(1); //카운트 돌려줄 수 있또록= 결과값 돌렺ㄹ 수 있도록
			return count==0?1:count;
		}catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if (rs != null)
					rs.close();
				if (ps != null)
					ps.close();
				if (conn != null)
					conn.close();
			}catch (Exception e2) {
				
			}
		}
	}
	
	/** 목록 관련 메서드 = 반환타입 어레이 리스트 */ ///권유하는 사항 아니므로 이 부분에 대한 계산식은 미리 만들기
	public ArrayList<BbsDTO> bbsList(int cp, int listSize) {
		try {
			conn = com.yong.db.YongDB.getConn();
			//String sql = "select * from jsp_bbs order by idx desc";
			
			int start=(cp-1)*listSize+1;
			int end=cp*listSize;
			//ref desc,sunbun asc) 250325 변경 및 추가 번호가 각자 다 각기각기 되지만 이렇게 바꿔줌으로써 답변은 답변에 본문밑에 답변 바로 되도록 순서대로
			String sql="    select * from "
					+ "    (select rownum as rnum,a.* from "
					+ "    (select * from jsp_bbs order by ref desc,sunbun asc)a)b "
					+ "    where rnum >=? and rnum <=?";
						//결과식 삭제하고 인 파라미터로 작성해줌
			ps = conn.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			ArrayList<BbsDTO> arr = new ArrayList<BbsDTO>();
			while (rs.next()) {
				int idx = rs.getInt("idx");
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");
				
				BbsDTO dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
				arr.add(dto);
			}
			return arr;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
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

	/** 본문 관련 메서드 */
	public BbsDTO bbsContent(int idx) {
		try {
			conn = com.yong.db.YongDB.getConn();
			
			setReadnum(idx); //내가 넘기는 데이터
			
			String sql = "select * from jsp_bbs where idx=?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, idx); // 데이터 하나가 검색한다는 전제조건으로 쿼리 한것이므로 데이터 담을 바구니 필요
			BbsDTO dto = null;
			rs = ps.executeQuery(); // 결과값 반환 결과갑 있으면 셋팅 없므녀 반환
			if (rs.next()) {// 검색된 데이터 있니?
				String writer = rs.getString("writer");
				String pwd = rs.getString("pwd");
				String title = rs.getString("title");
				String content = rs.getString("content");
				java.sql.Date writedate = rs.getDate("writedate");
				int readnum = rs.getInt("readnum");
				int ref = rs.getInt("ref");
				int lev = rs.getInt("lev");
				int sunbun = rs.getInt("sunbun");

				dto = new BbsDTO(idx, writer, pwd, title, content, writedate, readnum, ref, lev, sunbun);
			}
			return dto;
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
	
	 public int setReadnum(int idx) {
	       try {
	         String sql = "update jsp_bbs set readnum = readnum+1 where idx = ?";
	         ps = conn.prepareStatement(sql);
	         ps.setInt(1, idx);
	         int count = ps.executeUpdate();
	         return count;
	      } catch (Exception e) {
	         e.printStackTrace();
	         return -1;
	      }finally {
	         try {
	            if(ps!=null) ps.close();
	            
	         } catch (Exception e2) {
	            // TODO: handle exception
	         }
	      }
	    }
}
	