package com.yong.servlet;

import java.io.*;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//250226
public class GuestCountServlet extends HttpServlet { // 상속받기
   
   // 숫자를 새려면 숫자 보관하는 변수 생성 필요
   // 은닉화 시켜서 count변수 생성

   private int count;
   // 파일 정보도 프라이빗
   private String filename;
   // 초기화를 하는 시점은 생성자를
   // 생성자를 통해 객체가 만들어질 때 변수가 생성되므로 =0하지않고 생성자 만들고 하기

   public GuestCountServlet() {
      // 값의 초기화
      count = 0;
      filename="c:/student_java/count.txt";

   }
   // 생성자 호출 후에 init이 호출됨
   // 생성자가 값에 대한 초기화라면 init는 행위 초기화

   @Override
   public void init() throws ServletException {
      // 행위(기능) 초기화 는 init에서 함
      // 데이터 가져오기 위해서 new
      try {
         BufferedReader br = new BufferedReader(new FileReader(filename));
         String count_s = br.readLine(); // IOExCeption으로 모든 것 퉁침 excetion에서 바꿔줌
         count = Integer.parseInt(count_s);
         br.close();
         // 파일 들고올떈 writer 가져올 땐? reader? - 둘다 파일 연결시켜주는 얘
         // 파일 쓸려면 writer 읽을려면 reader
      } catch (IOException e) {
         e.printStackTrace();
      }
   }

   // 서비스를 보여주려면 이미 서비스가 사용자의 전송방식에 따라 doget,dopost를 한곳으로 집결
   // 서비스 건들지 말고 doget,dopost만들기
   // doget,dopost
   // 서비스를 오버라이딩하는 경우는 없음

   @Override
   protected void doGet(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {   
      userProcess(req, resp); // 유저프로세스를 호출하도록 할거임
   }

   @Override
   protected void doPost(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {
      userProcess(req, resp);
   }

   // 한번에 취합시킬 수 있도록 단일 진입할거임 - userprocess로
   protected void userProcess(HttpServletRequest req, HttpServletResponse resp)
         throws ServletException, IOException {

      resp.setContentType("text/html;charset=utf-8"); // 어떤 캐릭터 셋으로 번역해야돼 라고 알려주는 것 원래 위에다가 작성했던 걸 밑에다가 하는 것
      PrintWriter pw = resp.getWriter();

      pw.println("<html><head><title>");
      pw.println("손님 접속 카운트");
      pw.println("</title></head><body>");

      count++;
      pw.println("<h1 style='color:blue;'>현재까지의 접속자 수:"+count+"명</h1>");

      pw.println("</body></html>");
      pw.close(); // 자원 닫아줌
   }

   @Override
   public void destroy() {
      try { // filename을 매개값으로 준 것
         PrintWriter pw = new PrintWriter(new FileWriter(filename));
         pw.println(count);
         pw.close();
      } catch (IOException e) {
         e.printStackTrace();
      }

   }
}
