package com.yong.bbs;
import java.sql.*;


//  250324

public class BbsDTO {
	private int idx;
	private String writer;
	private String pwd;
	private String title;
	private String content;
	private Date writedate;
	private int readnum;
	private int ref;
	private int lev;
	private int sunbun;
	
	public BbsDTO() {
		// TODO Auto-generated constructor stub
	}

	public BbsDTO(int idx, String writer, String pwd, String title, String content, Date writedate, int readnum,
			int ref, int lev, int sunbun) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.pwd = pwd;
		this.title = title;
		this.content = content;
		this.writedate = writedate;
		this.readnum = readnum;
		this.ref = ref;
		this.lev = lev;
		this.sunbun = sunbun;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPwd() {
		return pwd;
	}

	public void setPwd(String pwd) {
		this.pwd = pwd;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getWritedate() {
		return writedate;
	}

	public void setWritedate(Date writedate) {
		this.writedate = writedate;
	}

	public int getReadnum() {
		return readnum;
	}

	public void setReadnum(int readnum) {
		this.readnum = readnum;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getLev() {
		return lev;
	}

	public void setLev(int lev) {
		this.lev = lev;
	}

	public int getSunbun() {
		return sunbun;
	}

	public void setSunbun(int sunbun) {
		this.sunbun = sunbun;
	}
}
