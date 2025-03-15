package com.yong.phonebook;
//DTO는 DB테이블 대상으로 모델링 (내가 설계할 테이블을 그대로 나열하기)
public class PhonebookDTO {

	private int idx;
	private String name;
	private String tel;
	private String addr;
	
	//기본 생성자
	
	public PhonebookDTO() {
	
	}

	public PhonebookDTO(int idx, String name, String tel, String addr) {
		super();
		this.idx = idx;
		this.name = name;
		this.tel = tel;
		this.addr = addr;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}
	
}
