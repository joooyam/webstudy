package com.yong.emp;

import java.util.*;
import java.sql.*;
import javax.sql.*;
import javax.naming.*;
////250305
//DB 반복적으로 사용되는 3대 컴포넌트 connection, ps, rs

/*DAO= 비즈니스 로직 담당
 EmpAdd_ok.jsp에서 한 것을 행위만을 위임받는 것 DAO가 위임받음
 insert update delete - 실행횟수를 기반으로 판단
  jdbc에서 받는 값을 그대로 토스?
*/
//위에서 계속 쓰일 멤버변수 미리 선언
public class EmpDAO {

   private Connection conn;
   private PreparedStatement ps;
   private ResultSet rs;

   public EmpDAO() {
      System.out.println("EmpDAO객체 생성됨 !");
   }

//   /** DB 연동 메서드 */
//   public void dbConnect() {
//      try {
//         Class.forName("oracle.jdbc.driver.OracleDriver"); // 드라이버 메모리에 로딩
//         String url = "jdbc:oracle:thin:@localhost:1521:xe";
//         String user = "scott";
//         String pwd = "1234";
//         conn = DriverManager.getConnection(url, user, pwd);
//      } catch (Exception e) {
//         e.printStackTrace();
//      } finally {
//         try {// finally 안에는 오류가 나던 안나던 실행해야하는 필수코드를 작성해야됨
//         } catch (Exception e2) {
//         }
//      }
//   }

   /** 사원등록 관련 메서드 */
   public int empAdd(EmpDTO dto) {// 변수 안쓰고 emp dto 모든 파일 가져옴
//         Class.forName("orcale.jdbc.dirver.OracleDriver"); //드라이버 얀걀

      // 자원쓰는 코드에서는 Try catch 사용
      try {
//        dbConnect();
    	 conn=com.yong.db.YongDB.getConn();
    	 
         String sql = "insert into employee2 values(employee2_idx.nextval,?,?,?)";
         ps = conn.prepareStatement(sql);
         ps.setString(1, dto.getName());
         ps.setString(2, dto.getEmail());
         ps.setString(3, dto.getDept());// dto가 가지고 있ㄴgetDept를 이용해 부서정보 가져옴
         int count = ps.executeUpdate();// //카트만 끌고 다니면 됨
         return count; // 자원 닫아줘야됨

      } catch (Exception e) {
         e.printStackTrace();
         return -1;// 나를 알려주는 것
      } finally {
         try {
            ps.close();
            conn.close();
         } catch (Exception e2) {
         }
      }

   }

   /** 사원 퇴사 관련 메소드 */

//insert upddate delete 는 반환타입은 모두 int (횟수에 대한 반환타입으로)
   public int empDel(EmpDTO dto) {
      // 1,2개는 dto만들필요는 없음 그냥 string name받는 것이 나음

      try {

//         dbConnect();
         String sql = "delete from employee2 where name=?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, dto.getName());
         int count = ps.executeUpdate();
         return count; // 나를 호출했던 녀석에게 돌려줌
         // 여기까지 비즈니스 로직
      } catch (Exception e) {
         e.printStackTrace();
         return -1;
         // 나를 호출했던 녀석에게 -1을 주면서 뭐가 좀 잘못됐다고 알려주는 것
      } finally { // 혹시 모를 상황을 대비해서 finally하는 것(예외사항을 피하기 위해서)
         try {
            // ps.close(); //한번정도 더 ps를 닫을 거냐고 물어보는 것이 나음
            // null일 때만 끊어줄거라고 말해줘야됨
            if (ps != null) {ps.close();
            } // 실행해야할 구문이 한 줄일 경우는 중괄호 안써도 되긴함
               // conn.close(); //connection이 null이 아닐때만 자원 끊을게
            if (conn != null)conn.close();
         } catch (Exception e2) {
         }
      }
   }

   /** 모든 사원 내역 관련 메서드 1번 */
   // 사원의 정보를 돌려주기 위함(컬럼=하나의 요소(의미x)컬럼들이 모인 하나의 low=하나의 객체)
   // 객체 정보를 표현하기 위한 것 =DTO(정보를 담기위한 목적) 내가 사용할 테이블의 컬럼을 대상으로 모델링함
   // DTO테이블이 가지고 있는 한 로우를 관리하기 위한 목적을 가지고 있는 것
   // public ResultSet
   // 연동 = 자원 ResultSet은 자원이르모 자원을 반납해야됨!
   // 결과를 저장하는 결과 클래스 x - jdb-DB 있을때 열결다리 PrepareStatement

   // vector 사용하여 돌려주는 방법..
   public EmpDTO[] empListPar1() {
      try {
//         dbConnect();
         String sql = "select * from employee2 order by idx desc";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();

         Vector<EmpDTO> arr = new Vector<EmpDTO>();
         while (rs.next()) {
            int idx = rs.getInt("idx");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String dept = rs.getString("dept");

            ////이렇게 작성했따가 삭제 하고 EmpDTO에 선언해서 삭제하고 DTO 객체 생성해서 가져옴 -> 그래서 밑ㅇ에 2줄로 간결해짐
            // 데이터 가져오려면 set하고 갯수만큼 셋팅해줘야함
//            EmpDTO dto=new EmpDTO();
//            dto.setIdx(idx);
//            dto.setName(name);
//            dto.setEmail(email);
//            dto.setDept(dept);
            
            //이게 EmpDTO에서 작성한 것
//             public EmpDTO(int idx, String name, String email, String dept) {
//                    this.idx = idx;
//                    this.name = name;
//                    this.email = email;
//                    this.dept = dept;

            EmpDTO dto = new EmpDTO(idx, name, email, dept);
            arr.add(dto);

         }
         EmpDTO dtos[] = new EmpDTO[arr.size()];
         arr.copyInto(dtos);// arr에 저장되어있는 것을 복사해ㅜ는 녀석
         return dtos;
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      } finally {
         try {
            if (rs != null)   rs.close();
            if (ps != null)   ps.close();
            if (conn != null)   conn.close();
         } catch (Exception e) {
         }
      }
   }

   /** 모든 사원 내역 관련메서드 2번째 */
   // 콜렉션 hashmap 사용 //arraylist를 반환타입으로 돌려줄거임
   public ArrayList<EmpDTO> empListPart2() {
      try {
     //    dbConnect();
         String sql = "select * from employee2 order by idx asc";
         ps = conn.prepareStatement(sql);
         rs = ps.executeQuery();
         //제너릭 선언<>
         ArrayList<EmpDTO> arr=new ArrayList<EmpDTO>();
         while(rs.next()) {
            int idx = rs.getInt("idx");
            String name = rs.getString("name");
            String email = rs.getString("email");
            String dept = rs.getString("dept");

            EmpDTO dto = new EmpDTO(idx, name, email, dept); //모든 인자생성자 호출
            arr.add(dto);
         }
         return arr; //Arraylist 돌려줌
         //여기까지가 조회에 대한 일반적인 코드
      } catch (Exception e) {
         e.printStackTrace();
         return null;
      } finally {
         try {
            //내가 쓴 자원 역순으로 돌려줌
            if(rs!=null)rs.close();
            if (ps != null)   ps.close();
            if (conn != null)conn.close();
         } catch (Exception e) {}
      }
   }

   
   /**수정 사원 정보 조회 관련 메서드*/
   // 조회니까 사원 정보만 돌려줘면 됨 - 사원정보는 dto
   public EmpDTO empUpdateSel(int idx) {
      //파라미터 1.2개는 그냥 넘기고 그 이상은 dto사용 그래서 딱 필요한 값만 받을 것임 int idx
      try {
//         dbConnect();
         String sql = "select * from employee2 where idx=?";
         ps = conn.prepareStatement(sql);
         ps.setInt(1, idx);
         rs = ps.executeQuery();
         EmpDTO dto=null;
         //empDTO를 담을 수 있는 dto를 초기화
         
         if(rs.next()) {
            String name=rs.getString("name");
            String email = rs.getString("email");
            String dept = rs.getString("dept");
            dto=new EmpDTO(idx, name,email,dept);
         }
         return dto;
         //조회된 결과가 있으먄 가져오고 없으면 null을 돌려주는?
      }catch (Exception e) {
         e.printStackTrace();
         return null;
      }finally {
         try {
            if(rs!=null) rs.close();
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();
         } catch (Exception e2) {}
      }
   }

   /**수정 관련 메서드*/
   public int empUpdate2(EmpDTO dto) {
      try {
         
//         dbConnect();
         String sql = "update employee2 set name=?, email=?, dept=? where idx=?";
         ps = conn.prepareStatement(sql);
         ps.setString(1, dto.getName());
         ps.setString(2, dto.getEmail());
         ps.setString(3, dto.getDept());
         ps.setInt(4, dto.getIdx());
         int count=ps.executeUpdate();
         return count;
      
      }catch (Exception e) {
         e.printStackTrace();
         return -1;
      }finally {
         try {
            if(ps!=null) ps.close();
            if(conn!=null) conn.close();   
         } catch (Exception e2) {}
      }
   }
}
