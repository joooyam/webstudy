package com.yong.gallery;

//250318 이미지 갤러리

public class GalleryDTO {

	private int idx;
	private String writer;
	private String originname;
	private String systemname;

	public GalleryDTO() {
	}

	public GalleryDTO(int idx, String writer, String originname, String systemname) {
		super();
		this.idx = idx;
		this.writer = writer;
		this.originname = originname;
		this.systemname = systemname;
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

	public String getOriginname() {
		return originname;
	}

	public void setOriginname(String originname) {
		this.originname = originname;
	}

	public String getSystemname() {
		return systemname;
	}

	public void setSystemname(String systemname) {
		this.systemname = systemname;
	}

}
