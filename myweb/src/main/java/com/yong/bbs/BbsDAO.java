package com.yong.bbs;

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

	/** 글쓰기 관련 메서드 */ // 정보들 dto에 담아서 사용하고 글쓰
	public int bbsWrite(BbsDTO dto) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_bbs values(jsp_bbs_idx.nextval,?,?,?,?,sysdate,0,0,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getWriter());
			ps.setString(2, dto.getPwd());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
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
			
			String sql="    select * from "
					+ "    (select rownum as rnum,a.* from "
					+ "    (select * from jsp_bbs order by idx desc)a)b "
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
}
