package com.yong.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//250226
public class GuguServlet extends HttpServlet{
   
      @Override
      protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
         userProcess(req, resp);
      }

      @Override    //HttpServletRequest req 얘가 요청  HttpServletResponse resp 얘가 응답
      protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
         userProcess(req, resp);
      }

      protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

         resp.setContentType("text/html;charset=UTF-8"); //콘텐츠에 대한 문서타입을 텍스트타입을 HTML문서라고 알려좀
         PrintWriter pw = resp.getWriter(); //UTF-8형식으로 번역해줘 라는 의미
      
         
      //////////////////////////////
         ///코드 작성하는 곳
      
         pw.println("<html><head><title>");
         pw.println("구구단 서블릿");
         pw.println("</title></head><body>");
         
         pw.println("<table border='1' width='550' cellspacing='0'>");
         for(int i=1; i<=9;i++) {
            pw.println("<tr>");
            for(int j=2; j<=9;j++) {
               pw.println("<td>");
               pw.println(j+"x"+i+"="+(j*i));
               pw.println("</td>");
            }
            pw.println("</tr>");
         }
         pw.println("</table>");
         
         
         pw.println("</body></html>");
   
         
         
      
      /////////////////////////////////
         
         
         pw.close(); //자원이므로 pw.닫아줌
         
      
      }

}
