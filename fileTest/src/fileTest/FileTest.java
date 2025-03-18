package fileTest;
///250318 파일 클래스는 io패키지에 있음
import java.io.*;
public class FileTest {

	public static void main(String[] args) {
		//1.파일 객체 생성 File 설계도에서 f객체 생성
		File f = new File("C:/java_student/lib/ojdbc6.jar");
		//3. 파일 or 폴더 존재 유무 확인 - exists메서드 사용
		System.out.println("f야 너 있니?" + f.exists());
		////2. 내가 원하는 파일 가져오기 
		
		//3. 파일인지 묻기
		System.out.println("f야 너 파일이니?"+f.isFile());
		//4. 폴더인지 묻기
		System.out.println("f야 너 폴더니~?"+f.isDirectory());
		//5. 이름 묻기
		System.out.println("f야 너 이름이 뭐야"+f.getName());
		//6. 용량 묻기
		System.out.println("너 용량이 몇이야?"+f.length());
//파일이므로 알 수 있는 정보 : 용량 표현하는 최소단위 비트  //이 파이릐 표현단위 바//이트
		
		
		File f2=new File("C:/java_student");
		
		System.out.println("f2야 너 있니?" + f2.exists());
		System.out.println("f2야 너 파일이니?"+f2.isFile());
		System.out.println("f2야 너 폴더니~?"+f2.isDirectory());
		System.out.println("f2야 너 이름이 뭐야?"+f2.getName()); 
		
		///폴더라는 게 명확하다는 전제
		System.out.println("=========================");
		File files[]=f2.listFiles();
		//
		for(int i=0; i<files.length; i++) {
			String type=files[i].isFile()?"[FILE]\t":"[DIR]\t";
			long len=files[i].isFile()?files[i].length():0;
			String len_s=files[i].isFile()?"("+len+"byte)":""; //파일일 경우
			//System.out.println(files[i].getName());
			System.out.println(type+files[i].getName()+len_s);
		}
		
		File f3=new File("c:/java_student/lib/maketest");
		System.out.println("f3야 너 있니?"+f3.exists());
		f3.mkdir(); //페이크 디렉토리를 호출하면 처음엔 false했다가 생성 되고 true로 바뀜
	
		File f4=new File("c:/java_student/count.txt");
		System.out.println("f4야 너 있니?"+f4.exists());
		f4.delete(); //삭제 기능
		
		
	}

}
