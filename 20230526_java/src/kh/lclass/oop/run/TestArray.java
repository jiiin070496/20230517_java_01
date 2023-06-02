package kh.lclass.oop.run;

import kh.lclass.oop.sample.Person;
import kh.lclass.oop.sample.Student;

public class TestArray {
	final int a = 10;
	public static void main(String[] args) {
		
		
		 Object obj1 = new Student(); 
		 Object obj2 = new Student(); 
		 Person p1 = new Student();	
		//obj1.
		//p1.
		
	
		
		
		
		
		final int b = 11;
		int n = 0;
		for(final int maxCnt = 5; n<10; n++) {
			System.out.println("테스트 "+ n);
		}
		Person[] personArray = new Person[22];
		for(int i = 0; i < personArray.length; i++) {
			personArray[i] = new Person(); 
		}
		//personArray[0].setAge(22);
		//오류발생
		//personArray[0].setAge(25); 
		// NullPointerException 
		// 원인 : 점(.) 앞에있는 변수(객체=인스턴스)가 Null상태(personArray[] 0번 주소가 없다)
		// 즉 personArray[0]이 null주소값을 가지고 있었음.
		// 해결방법 : 변수(객체=인스턴스)에 new 생성자(); 를 해줌 
		Person[] personArray3 = new Person[22];
		personArray3[0] = new Person();   //4byte짜리 22개 주소를 가질 수 있는 공간
		personArray3[0].setAge(25);
		personArray3[0].setName("김소똥");
		//personArray3[0].setGender('여');
		//personArray3[0].setGender('여');
		personArray3[1] = new Person("김개똥", 19, '남');
		personArray3[2] = new Person("김말똥", 22, '남');
		System.out.println(personArray3);
		System.out.println(personArray3[0].getName()); // 김소똥
		
		System.out.println("=====Student=====");
		Student[] stdArray = new Student[3];
		for(int i = 0; i<stdArray.length; i++) {
			stdArray[i] = new Student() {
				@Override
				public void setGrade(int grade) {
					System.out.println("학년 " + 3);
			 }
			};
		}
		stdArray[0].setAge(15);
		stdArray[0].setName("김영희");
		stdArray[0].setGender('여');
		stdArray[0].setScore(85);
		stdArray[0].setGrade(3);
		System.out.println(stdArray[0].getName());
		System.out.println(stdArray[0].getAge());
		System.out.println(stdArray[0].getGender());
		System.out.println(stdArray[0].toString());
		
		//Student [name=, score=85, grade=3, 
		//toString()=Person [name=null, age=15, gender=여]]
		
		Student yh = new Student("김영희", '여', 20, 1) {
			@Override
			public void setGrade(int grade) {
				System.out.println("학년 지정함");
			}
		};
	}

}
