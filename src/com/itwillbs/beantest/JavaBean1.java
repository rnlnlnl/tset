package com.itwillbs.beantest;

public class JavaBean1{
	
	// 테이블의 컬럼명 == 자바빈 변수명 == 파라미터명
	private String id;
	
	//public JavaBean1(){}
	
	//alt + shift + s + r 단축키
	
	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}
	
	// 오버라이딩 != 오버로딩(상속이없어도 쓸수 있다)
	// 메서드 오버라이딩 (상속이없으면 쓸수 없다)
	// alt shift s
	
//	@Override
//	public String toString() {
//		
//		return "메서드 오버라이딩";
//	}
	
	// bean객체에 무슨값이 들어있는지 확인하는것 회사가서 씀
	@Override
	public String toString() {
		return "JavaBean1 [id=" + id + "]";
	}
	
	
	
	
	
	
}
