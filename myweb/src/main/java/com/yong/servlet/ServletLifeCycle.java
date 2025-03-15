package com.yong.servlet;
//250226
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ServletLifeCycle extends HttpServlet {

   // 1.객체 만들기 위해서 생성자 호출
   public ServletLifeCycle() {
      // 멤버변수(값) 초기화 하는 것이 목적
      System.out.println("1. 생성자 호출됨!");
   }

   @Override
   public void init() throws ServletException {// init메소드는기능의 초기화를 목적으로 하는 것
      // 기능의 초기화
      System.out.println("2.init메서드 호출됨 !");
   }

   @Override
   protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
      System.out.println("3. service메서드 호출됨 !!!");
   }

   @Override
   public void destroy() {
      System.out.println("4. destroy메서드 호출됨~ !!!");
   }
}
//서버탭에서 종료하면 컴퓨터 끄는 느낌
//콘솔에서 종료하면 코드를 뽑아버리는 느낌