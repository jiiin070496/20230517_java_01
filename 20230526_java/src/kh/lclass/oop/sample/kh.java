package kh.lclass.oop.sample;

import java.io.Serializable;

public class kh implements TestInterface, Serializable {
	
	static final long serialVersionUID = 1L; // Serial = 직렬화
	
	public void khSpecial() {
		int a = Integer.parseInt("AAA"); 
	}
	@Override
	public void method1() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String method2() {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int method3(int a, int b) {
		// TODO Auto-generated method stub
		return 0;
	}

	
}
