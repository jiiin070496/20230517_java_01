package kh.lclass;

import java.util.Arrays;

public class TestArray {
	public static void main(String[] args) {
		String[] strArr = new String[3]; //배열생성 or 배열선언
		strArr[0] = "Apple"; //1, 2는 기본자료형처럼 사용하는 것 , [1,2,3] 값을 주는 행동
		strArr[1] = "Banana";
		strArr[2] = new String("Mango"); //다시 만듬
		//strArr를 복사해서 strCopyArr 생성
		String[] strCopyArr = new String[strArr.length];
		for (int i = 0; i < strArr.length; i++) {
			strCopyArr[i] = strArr[i];
		}
		strArr[2] = "orange";
		strCopyArr[1] = "딸기";
		for (int i = 0; i < strArr.length; i++) {
			System.out.println(strArr[i] +":"+strCopyArr[i]);
		}
		System.out.println("==============");
		
		//자료형 심화
		int a = 10; //기본자료형 메소드제공 X
		int[] arrA = new int[3];
		arrA[2] = 20;
		int[] arrB = arrA.clone();  //배열에서 제공
		System.out.println(arrB.length);
		System.out.println(arrB[2]);
		
		//Arrays. 는 java.util소속, 소속엔 스테틱메서드가 많음
 		String[] strCopyArr2 = Arrays.copyOf(strArr, 2);  //5를 찍어도 콘솔에 실행된다
 		for(int i = 0; i < strCopyArr.length; i++) {
 			System.out.println(strCopyArr[i]);
 		}
 			
		System.out.println("========System========");
		String[] strCopyArr3 = new String[5];
		System.arraycopy(strArr, 0, strCopyArr3, 3, 2);
		for(int i = 0; i < strCopyArr3.length; i++) {
 			System.out.println(strCopyArr3[i]);
 			
 		
 		}
		
		
		
		
		String[] strArr2 = {"Apple", "Banana", new String("Mango")};
		String[] strArr3 = {new String("Apple"), new String("Banana"), new String("Mango")};// 객체배열의 초기화행동
		String[] strArr4 = new String[]{new String("Apple"),new String("Banana"), new String("Mango")};
		String[] strArr5 = new String[]{"Apple", "Banana", new String("Mango")};
		
		
		
		System.out.println("strArr의 0번째 과일은" + strArr[0]);
		System.out.println("strArr의 1번째 과일은" + strArr[1]);
		System.out.println("strArr의 2번째 과일은" + strArr[2]); // 이렇게보단 반복문
		
		for(int i = 0; i < strArr.length; i++) {            //시작 0~2 1++  .length는 strArr의 개수
			System.out.printf("strArr의 %d번째 과일은 %s\n", i, strArr[i]);

		}

		//기본복사 Ex)
		int[] arr6 = new int[] {1, 2, 3, 4, 5};
		int[] arr7 = arr6;		
		arr7[3] = 42;
		System.out.println(arr6[3]); //42
		System.out.println(arr7[3]); //42
		
		
		
		
		//System.out.println(strArr[2]); //초기값을 안적으면 초기값을 jvm이 설정해줌 null
		
		int[] intArr = new int[3];    //초기값을 안적으면 초기값을 jvm이 설정해줌 0
		System.out.println(intArr[1]);
		
		int[] intArr2 = new int[] {1,2,3};
		int[] intArr3 = {1,2,3};  //이렇게 작성 가능하지만 2차원배열과 객체배열의 모양이 비슷하기때문에 잘 쓰지않음.
		
		//Student[] studentArr = new
		System.out.println(intArr[2]);
	}

}
