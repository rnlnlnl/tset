package com.itwillbs.test;

// package란 한꾸러미 안에 묶어 놓는다. 비슷한거끼리
// * 패키지명은 회사의 도메인 주소를 반대로 사용
// test.itwillbs.com
// www.itwillbs.com

// 학생정보 -> 점수 총합, 평균 출력
// (이름, 국, 영, 수)

public class Main {
	
	
	// mySum(k, e, m)
	// 재정의 할때 컴파일러는 구분을 할때 전달인자의 이름과, 타입과, 개수를 사용해 구분한다 
	public double mySum(int k, int e, int m){
		int sum = k+e+m;
		return sum;
		//return k+e+m;
	}
	
	public void mySum(int k,int e,int m, String name){
		System.out.println(name+"님 총점 : "+(k+e+m));
	}
	public void mySum(Student kim){
		System.out.println(kim.getName()+"님의 총점 : "+(kim.getKo()+kim.getEn()+kim.getMa()));
	}
	
	
	// myAVG(k, e, m)
	
	public static void myAVG(int k,int e,int m){  // static이 실행 하는 동안 인스턴스 는 사라진다 
		System.out.println("평균 : "+(k+e+m)/3.0);
	}
	
	public static void main(String[] args){
	String name = "김또깡";
	int ko = 94;
	int en = 46;
	int ma = 87;
	
	System.out.println(name+"님의 총 합 :"+(ko+en+ma));
	System.out.println(name+"님의 평균 :"+(ko+en+ma)/3);
	
	System.out.println("---------------------------------------");
	// 총 합을 계산하는 메서드 mySum(k, e, m) 값을 리턴 - 인스턴스 메서드
	Main m = new Main();
	m.mySum(ko, en, ma);
	System.out.println("총합 : "+m.mySum(ko, en, ma));
	// 평균 계산하는 메서드 myAVG(k, e, m) 출력 - 스테틱 메서드
	myAVG(ko, en, ma);
	
	System.out.println("---------------------------------------");
	
	// 학생의 정보를 저장하는 객체 생성
	
	Student kim = new Student();
	kim.test=0; // 누구나 사용이 가능하다
	//kim.name = "홍길동";
	kim.setName("흥부");
	kim.getName();
	
	// "김학생 국:77,영:88,수:99" 총점 게산
	// 위 학생 정보를  사용해서 총점을 출력하는 메서드를 오버로딩
	Student jung = new Student();
	jung.setName("김학생");
	jung.setKo(77);
	jung.setEn(88);
	jung.setMa(99);
	
	m.mySum(jung);
	m.mySum(jung.getKo(), jung.getEn(), jung.getMa(), jung.getName());
	
	// 동작 분리 -> 계산하는 메서드 동작을 분리
	
	// Cal 객체 - 총점/평균메서드 구현
	
	// 계산기 객체
	Cal c = new Cal();
	System.out.println(c.Cal_Sum("이순신", 99, 90, 100)); //전달인자 6개 까지 사용 권장 그이상이면 효율이 매우나쁘다
	
	Student stu = new Student();
	stu.setName("이순신");
	stu.setKo(100);
	stu.setEn(99);
	stu.setMa(99);
	
	System.out.println(c.Cal_Sum(stu));
	
	c.Cal_AVG(stu);
	// set 메서드에서는 변수를 변경이고
	// 생성자는 변수를 초기화 이다
	
	
	}
	
}
