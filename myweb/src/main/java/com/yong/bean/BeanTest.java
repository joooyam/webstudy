package com.yong.bean;
//데이터를 처리하는 자바 클래스
//사용자로부터 입력받은 이름,나이...정보를 담고 반환하는 역할
public class BeanTest {
   
   private String name;
   private int age;
   private String tel;
   private String addr;
   private String idx;
   /////250305
   // 1. 이름, 나이를 담을 멤버변수 선언
   // 2. 은닉화
   // 3. 생성자 호출
   // 4. 이름과 나이에 접근하기 위해서 공개된 메소드 생성(Getter,setter)
   // Getter : 값을 저장하기 위한 목적
   // Setter : 값을 전문적으로 반환하기 위한 목적 (반환타입 )
   public BeanTest() {
      System.out.println("BeanTest객체 생성됨 !");

   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public int getAge() {
      return age;
   }

   public void setAge(int age) {
      this.age = age;
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
