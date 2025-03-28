package com.yong.filebbs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

//250317 파일 올리는 법

public class FileBbsDAO {
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;

	public FileBbsDAO() {
		// TODO Auto-generated constructor stub
	}

	/** 파일 정보 등록 관련 메서드 */
	// int를 돌려주도록 하되 fileUpload() 메서드 생성
	public int fileBbsUpload(String filename, String writer) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql = "insert into jsp_filebbs values(jsp_filebbs_idx.nextval,?,?)";
			ps = conn.prepareStatement(sql);
			ps.setString(1, filename); // dto로부터 getId가져옴
			ps.setString(2, writer);
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

	/** 목록 관련 메서드*/
	public ArrayList<FileBbsDTO> fileBbsList(){
		try {
			
			conn = com.yong.db.YongDB.getConn();
			String sql = "select * from jsp_filebbs order by idx desc";
			ps = conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<FileBbsDTO> arr=new ArrayList<FileBbsDTO>();
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String filename=rs.getString("filename");
				String writer=rs.getString("writer");
				FileBbsDTO dto=new FileBbsDTO(idx,filename,writer);
				arr.add(dto);
			}
			return arr;
	}catch (Exception e) {
		e.printStackTrace();
		return null;
	}finally {

		try {
			 if (rs != null) rs.close();
	         if (ps != null) ps.close();
	         if (conn != null) conn.close();
		}catch (Exception e2) {}
		}
	}
}
