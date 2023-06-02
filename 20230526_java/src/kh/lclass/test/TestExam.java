package kh.lclass.test;

import java.util.Scanner;

public class TestExam {
	public static void main(String[] args) {
		new TestExam().printGugudan();
	}
	public void printGugudan() {
		Scanner sc = new Scanner(System.in);
		System.out.print("정수 입력: ");
		int dan = sc.nextInt();
		//dan이 2-9사이정수라면
		
		if(dan >=2 && dan <= 9) {
			for(int i = 1; i <10; i++ ) {
				System.out.println(dan + "X" + i + "=" + dan*i);
			}
		}else {
			System.out.print("2~9 사이 정수를 입력해주세요");

		}
	}
}
