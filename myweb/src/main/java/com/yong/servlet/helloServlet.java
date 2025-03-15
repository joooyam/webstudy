package com.yong.servlet;

import java.io.*;
import java.util.Calendar;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//250226
public class helloServlet extends HttpServlet {

   
   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      userProcess(req, resp);
   }
   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      // TODO Auto-generated method stub
      userProcess(req, resp);
   }
   protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
   
      resp.setContentType("text/html;charset=UTF-8");
      PrintWriter pw=resp.getWriter();
      
      pw.println("<html>"); //자바코드 내에 html태그 쓰는 법
      pw.println("<head><title>");
      pw.println("이것은 서블릿");
      pw.println("</title></head>");
      pw.println("<body>");
      pw.println("<h1>이것은 servlet입니다</h1>");
      
      Calendar now=Calendar.getInstance();
      int y=now.get(Calendar.YEAR);
      int m=now.get(Calendar.MONTH);
      int d=now.get(Calendar.DATE);
      
      pw.println("<h1>"+y+" 년 "+m+1 +"월 "+d+"일<h1>");
      
      pw.println("</body></html>");
      pw.close();
      //서블릿은 서버에 등록해야 사용이 가능함
      //패키지 익스플러오 열고 src-WEB-INF - lib - web.xml
   }
}
