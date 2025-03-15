package com.yong.db;

import java.sql.*;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

//250310
public class YongDB { //기능만 쓰기 위한 것 dto,dao객체를 따로 만들어서 기능

	static DataSource ds; //밑에 블록안에 있으면 지역변수가 되므로 멤버변수가 되도록 선언함
	//대신 static 변수로 선언해줘야됨
	//내가 올리는 시점에서 메모리에 올라옴?
	static {
		try {
			Context initContext = new InitialContext();
			Context envContext = (Context) initContext.lookup("java:/comp/env");
			ds = (DataSource) envContext.lookup("jdbc/myoracle");
			// static 키워드 부착하면 이 블록은 static 블록이됨
			// static이 실행되는 시점에서 메모리에 올리는 것
		} catch (Exception e) {
			//비디오 가게를 찾는 이게 선 수행됨 = 
		}
	}

	public static Connection getConn() throws Exception {

		return ds.getConnection();

	}
}
