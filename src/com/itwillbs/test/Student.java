package com.itwillbs.test;

public class Student {
	// 학생의 정보를 저장
	
	private String name;
	private int ko;
	private int en;
	private int ma;
	int test;
	
	// public Student() {	} 기본 생성자 만들어져 있다
	// 기본생성자는 컴파일러가 오버로딩된 생성자가 없을 경우 자동으로 기본생성자를 생성
	
	
	// set/get()생성
	// alt + shift + s + r 단축키
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKo() {
		return ko;
	}
	public void setKo(int ko) {
		this.ko = ko;
	}
	public int getEn() {
		return en;
	}
	public void setEn(int en) {
		this.en = en;
	}
	public int getMa() {
		return ma;
	}
	public void setMa(int ma) {
		this.ma = ma;
	}
	
	
	
	
}
