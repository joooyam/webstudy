package com.yong.member;
import java.sql.*;

///250307
///
public class MemberDTO {

   private int idx;
   private String id;
   private String pwd;
   private String name;
   private String email;
   private String tel;
   private String addr;
   private Date joindate; //DB에서 제공해주는 클래스 제공 0 자료형 표현해주는 목적으로 사용
   
   //기본생성자.인자생성자,getter-setter//
   
   public MemberDTO() {
      
   }

   public MemberDTO(int idx, String id, String pwd, String name, String email, String tel, String addr,
         Date joindate) {
      super();
      this.idx = idx;
      this.id = id;
      this.pwd = pwd;
      this.name = name;
      this.email = email;
      this.tel = tel;
      this.addr = addr;
      this.joindate = joindate;
   }

   public int getIdx() {
      return idx;
   }

   public void setIdx(int idx) {
      this.idx = idx;
   }

   public String getId() {
      return id;
   }

   public void setId(String id) {
      this.id = id;
   }

   public String getPwd() {
      return pwd;
   }

   public void setPwd(String pwd) {
      this.pwd = pwd;
   }

   public String getName() {
      return name;
   }

   public void setName(String name) {
      this.name = name;
   }

   public String getEmail() {
      return email;
   }

   public void setEmail(String email) {
      this.email = email;
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

   public Date getJoindate() {
      return joindate;
   }

   public void setJoindate(Date joindate) {
      this.joindate = joindate;
   }   
   
}
