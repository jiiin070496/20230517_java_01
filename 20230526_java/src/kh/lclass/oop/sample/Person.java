package kh.lclass.oop.sample;

public class Person /* extends Object(적지않아도 자동으로 들어가있음) */ {

	private String name;  //주민등록상의 이름
	private int age;
	private char gender;

	// 기본생성자
	public Person() {}

	// allArgumentConstructer , Argument - 매개인자
	public Person(String name, int age, char gender) { 
		this.name = name;          //생성자 초기화, 생성시에 받아옴
		this.age = age;
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "Person [name=" + name + ", age=" + age + ", gender=" + gender + "]";
	}

	// getter/setter
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}


}
