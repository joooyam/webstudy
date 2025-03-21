package com.yong.wf;
//파일에 대한 클래스 사용하므로 IO패키지 가져옴
import java.io.*;

////////////////////250319 사용자 정보 webfolder랑 연결 ~250320

//필요한 정보들 : 용량,탐색기 필요할 때 사용자의 
// 절대 경로 l c나 d의 절대 경로가 필요한데 request의 정보를 계쏙 가져올 수 있도록 basepath변수 만듦
public class WebFolderDAO {
	
	private String basepath; //기본 경로 
	private String userid; //사용할 계정 정보 (사용자 폴더 이름)    아이디 정보 모아드는 변수
	private long totalsize,usedsize,freesize;  //용량 : int로 안되고 long으로 반환해줌 총용량,사용용량,남은 용량
	private String crpath; //현재경로(현재위치 가리키는 것) //250320 4.탐색기 
	
	public WebFolderDAO() {  //초기화 개개인 사용자 마다 20메가 주기로 설정
		totalsize=1024*1024*20; // 물리적 적용이 아니라 사용자에게 20메가만 안넘어가도록만 설정해주면 됨 사용용량=알 수 없음 (구해야됨 ),남은용량은(사용용량 알아야 구할 수 있음)
		usedsize=0;
		freesize=0; //은닉화 해주면 get,set
		//사용용량을 생성자에서 초기화해줌 객체는 1번 만들어지면 USE.FREE는 초기화 1번해줌 근데 계쏙 해주게됨
		
	}
	

	public String getCrpath() {
		return crpath;
	}


	public void setCrpath(String crpath) {
		this.crpath = crpath;
	}


	public String getBasepath() {
		return basepath;
	}

	public void setBasepath(String basepath) {
		this.basepath = basepath;
	}

	public String getUserid() {
		return userid;
	}

	public void setUserid(String userid) {
		this.userid = userid;
	}

	public long getTotalsize() {
		return totalsize;
	}

	public void setTotalsize(long totalsize) {
		this.totalsize = totalsize;
	}

	public long getUsedsize() {
		return usedsize;
	}

	public void setUsedsize(long usedsize) {
		this.usedsize = usedsize;
	}

	public long getFreesize() {
		return freesize;
	}

	public void setFreesize(long freesize) {
		this.freesize = freesize;
	}
	//기능 만들기 1. 사용에 대한 공간의 존재 유무 파악하기 (처음 사용한 접속자는 공간이 없으므로 공간 만들어줘야돼서)
	//파일 이라는 클래스로 api제시 해준걸로 원하는 기능 찾아쯔면 됨 
	
	/** 사용자 폴더 만들기 관련 메서드 */  //void로 하는 건 이유있음
	
	public void userFolderExists() {
		//1. 폴더 존재 유무 (없으면 사용 못하므로)
		
		File f=new File(basepath+"/"+userid); //파일 클래스는 기본 생성자 없음 기본적으로 폴더의 정보를 닮고 있는 정보클래스므로
		//파일에 대한 정보가 사용자에 대한 정보 닮고 있으므로  basepath로 절대 경보 잡기 사용자 아이디에 대한 정보 가지고올 수 잇음 두개 더하면
		if(!f.exists()) {
			f.mkdir(); //폴어 있다는 전제로 용량 까지 확인 가능
			
			//용량에 대한 변화없으려면
	
			
		}
		//존재하니? 없을때만 가져오게 하기 아니요 하면 네 하고 if문에 걸리도록 해서 없다라는 얘기갇 됨 = 걍 만들어주면 됨
		//만들 때 사용하는 메서드 = mkdir로 해당 폴더를 만들 수 있음
			//사용자가 접속할 때 사용할 수 있도록
		usedsize=0;     		// 이렇게 안하면 10인 상태에서 계쏙 누적되고 누적된 상태에서 늘어나는 것이므로 새로고침할때 사용한 양만 누적될 수 잇또록 
		settingUsedSize(f); //실제 용량 계산 관련 메서드 임
		freesize=totalsize-usedsize; //
		
	}
	
	/**실제 용량 계산 관련 메서드*/ // 이건 폴더 정보를 가지공 있는 파일이라는 전제하에 넘겨받는 것이 반복되는 것!!!! 
	public void settingUsedSize(File f) { //파일 타입의 f라는 녀석을 넘겨받음 = 전제가 깔림 (첫출발 폴더로 시작) 
		//만약에 파일일 경우라면? - 개발자는 절대 만약에 이럼 어떡하냐는 말 하면 안됨 
		//넘기는 파일 객체는 = 폴더라는 내용이 전해짐 이미 전제를 깔고 간는 것이므로 처음시작하면 폴더이므로 폴더이므로 얻어올 수 있는 정보는 = list
		File files[]=f.listFiles();//폴더라면 용량 가져오는데 
		for(int i=0; i<files.length; i++) { //중가하면서 요소에 접근
			if(files[i].isFile()) { //파일 있냐고 물어봄 
				usedsize+=files[i].length(); //usedsize에 파일을 더해서 계속 ㅓ넣을게
				
				//내가 가지고 있는 폴더 안에 파일이라는 녀석 안에서만 누적시켰으므로 폴더 안에 없으면 포함 시키지 않게됨
			}else {
				//폴더가 아니야 할때 다시 쓸 수 있음
				settingUsedSize(files[i]);//재귀함수 호출  파일이니 ? 예 하면 누적  폴더니? 하면 다시 위에 토스해줌 I 가 폴더 정보 다시 읽고 
				
				//1.재귀함수 호출 = 같은 프로세스를 여러개 만드는 기술 ; = 내이름을 다시 호출하는 것처럼 보이지만 셋팅 유즈사이즈가 셋팅유즈사이즐ㄹ 호출하면 
				//2, 내가 끝나지 않은 상태에서 같은 프로세스를 가지고 있는 구동체가 그 위해서 수행하게 되어있음
				//3. 더이상 폴더 없어서 젤 마지막에 드렁ㄴ녀석이 끝내는 방식 
				//4. 소멸했을 때 나를 호출했던 것이 다시 호출하게됨 (내가 나를 호출할때)다시 돌아가서 내가 사용한 용량을 읽어냄??
				//메모리 = 레지스터리,스태틱,스택,heap 에서 스택 메모리영영은 또다른 자료구조임
				// 
			}
			
		}
		
	}
	
	/**단일 파일 및 폴더 삭제 관련 메서드*/
	public void oneFileDelete(String target) { //삭제 하려면 이름있 필요 - string타입 인자 받음 가져오기 위해서
		File f=new File(basepath+"/"+crpath+"/"+target);//경로를 통해 파일 객체 가져올 것임
		if(f.isFile()) {
			f.delete();
		}else {
			f.delete(); //파일 하나일 때 삭제되지만 / 폴더는 삭제는 안됨
		}
	}
	
	/**폴더 일 때 삭제 기능관련메서드*/ //폴더일때이므로 public누구나 접근가능하게함 (삭제할 대상 매개값으로 받음
	public void deleteFolders(File f) {
		File files[]=f.listFiles();
		for(int i=0; i<files.length; i++) {
			if(files[i].isFile()) {
				files[i].delete();
			}else {
				deleteFolders(files[i]); //기능 반복해서 삭제할 수 있음 메서드 재탕한 것..?
				files[i].delete();//폴더일때 삭제할 수 있는 녀석 재탕가능함 =
				
			}
		}
	}
	
}











