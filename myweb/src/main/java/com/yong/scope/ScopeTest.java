package com.yong.scope;

public class ScopeTest {

	/////////// 250313 Scope ///////
	//내가 객체를 만듦으로써 데이터 산지 안산지 유무 확인 !!
	
	private int count;
	
	//객체 만들어지면 생성자 호출해짐
	public ScopeTest() {
		count=0;
		System.out.println("ScopeTest객체 생성됨!");
	}

	public int getCount() {
		System.out.println("돌려준 count값:"+count);
		return count;
	}

	public void setCount(int count) {
		this.count += count;
		System.out.println(count+"값이 입력되고 누적된 값은 "+this.count+"입니다.");
	}
	
}
