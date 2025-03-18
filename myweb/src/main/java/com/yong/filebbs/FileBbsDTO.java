package com.yong.filebbs;

//250317 파일 올리는 법

public class FileBbsDTO {
	private int idx;
	private String filename;
	private String writer;

	public FileBbsDTO() { //1.기본생성자
		// TODO Auto-generated constructor stub
	}

	public FileBbsDTO(int idx, String filename, String writer) {//2. 인자생성자
		super();
		this.idx = idx;
		this.filename = filename;
		this.writer = writer;
	}
	//getter , setter
	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

}
