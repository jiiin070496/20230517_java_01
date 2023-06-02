package kh.lclass.oop.sample;

//class예약어 키워드 abstract는 해당 클래스 내에 abstract 메소드가 0개 이상 있을것이라는 것을 의미함.
public class Student extends Person{  

		private String name; //학생증용 이름
//		private int age;
//		private char gender;
		private int score;
		private int grade;
		private final int maxCount = 10;
		
		public Student() {
			super("김말똥", 22, '남');       //=> person("김말똥", 22, '남')
			
		}
		public Student(String name, char gender, int age, int grade) {
			super(name, age, gender);
			this.name = name;
			this.grade = grade;
		}
		
		@Override
		public String toString() {
			return "Student [name=" + name + ", score=" + score + ", grade=" + grade + ", toString()="
					+ super.toString() + "]";
		}
		@Override //person의 name이 아닌 Student에있는 name을 쓰고싶을때
		public String getName() {    //부모인 person의 name, 학생증용
			return super.getName();
		}
		public String getName1() {    //학생증용
			return this.name;
		}
		
		@Override //부모의 기능과 별개로 재정의 할떄
		// overriding 재정의 가능
		//성립조건 : 상속한 클래스의 메소드와 동일한 클래스명
		//매개변수 자료형, 개수 동일 
		//return type 동일

		//단, 접근제한자는 달라도 된다.
		//부모메소드의 접근제한자 보다 넓은 범위의 접근제한자를 사용해야한다.
		public int getAge() {    //Student의 age
			return super.getAge()+1; //자료형 다를때he return type is incompatible with Person.getAge()
		}
		public int getScore() {
			return score;
		}
		public void setScore(int score) {
			this.score = score;
		}
		public int getGrade() {
			return grade;
		}

		//변수 선언 // 
		//메소드 정의 //이 기능은 이런이런기능으로 되어있어
		
		//메소드 선언 ~ 기능이 있을거야. 있어야해
		public void setGrade(int grade){
			this.grade = grade; 
			}
													 
//		public void setName(String name) {    // 초기에 대입해야할 것엔 setter x("김영희")
//			this.name = name;
//		}

		
}
