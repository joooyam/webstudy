package com.yong.gallery;

import java.util.*;

import com.oreilly.servlet.MultipartRequest;

import java.sql.*;
// 250318 이미지 갤러리
public class GalleryDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public GalleryDAO() {
		
	}
	
	/** 이미지 등록 관련 메서드*/ //하나 이상의 데이터 카트에 담기위해 (dto)
	//멀티파트리퀘스트는 카트처럼 사용도 가능 = 객체므로 매개값으로 받아서
	//매개값으로 받아서 하나씩 받는 방법보다 여러개 받기 위해서
	public int imgAdd(String writer, MultipartRequest mr) {
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql="insert into jsp_imggallery "
					+ "values(jsp_imggallery_idx.nextval,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, writer); //원본이름 가져오기는 것을 이름을 가리켜주는 것 form에서 imgname이름으로 이미지 input이 이름이 imgname이라서
			String originname=mr.getOriginalFileName("imgname");
			String systemname=mr.getFilesystemName("imgname");
			ps.setString(2, originname);
			ps.setString(3, systemname);
			int count=ps.executeUpdate();
			return count;
		}catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch (Exception e2) {}
		}
	}
	
	
	/** 목록 출력 관련 메서드*/
	public ArrayList<GalleryDTO> imgList(){
		try {
			conn = com.yong.db.YongDB.getConn();
			String sql="select * from jsp_imggallery order by idx desc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<GalleryDTO> arr=new ArrayList<GalleryDTO>();
			
			while(rs.next()) {
				int idx=rs.getInt("idx");
				String writer=rs.getString("writer");
				String originname=rs.getString("originname");
				String systemname=rs.getString("systemname");
				GalleryDTO dto = new GalleryDTO(idx, writer, originname, systemname);
				arr.add(dto);
			}
			return arr;
		}catch (Exception e) {
		e.printStackTrace();
		return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)rs.close();
				if(conn!=null)conn.close();
			}catch (Exception e2) {
				
			}
		}
	}

}






