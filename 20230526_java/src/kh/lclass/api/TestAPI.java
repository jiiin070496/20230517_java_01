package kh.lclass.api;

import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.InputMismatchException;
import static kh.lclass.api.KHCommonAPI.*; //(1.)
import java.util.Scanner;
import java.util.StringTokenizer;
import kh.lclass.vo.TestVo;

public class TestAPI {
	public void testDate() {
		Date now = new Date();
		System.out.println(now);
		Date when = new Date(1000 * 60 * 60L);// 1000(1초)*60(1분)*60(1시간)
		System.out.println(when);
		Calendar c = Calendar.getInstance();// Singleton
		// Calendar c = new Calendar(); - 오류
		// Cannot instantiate the type Calendar
		// 원인 1.abstract - new 생성 불가, 2. 생성자 접근제한자 protected
		// getInstance 메소드를 통해 객체 생성 가능
		Calendar c2 = new GregorianCalendar();
		System.out.println(c2.getTime());

		TestSingleton ts = TestSingleton.getInstance();
		System.out.println(ts.getA()); // 10
		ts.setA(50);
		System.out.println(ts.getA());// 50
		TestSingleton ts2 = TestSingleton.getInstance();
		System.out.println(ts2.getA());// 50
		ts.setA(100);
		System.out.println(ts2.getA());// 100
	}

//	public boolean checkMenu(int start, int end, int value) {// 함수를 호출하는 기본모양
//		boolean result = false;
//		if (value < start || value > end) {
//			// 비정상 입력경우
//			System.out.printf("%d - %d 사이 선택해주세요.\n", start, end);
//		}else {
//			//정상입력
//			result = true;
//		}
//		return result;
//	}

	public void testWrapperDoWhile() {
		Scanner sc = new Scanner(System.in);

		while (true) {
			System.out.print("메뉴 1-5사이 선택해주세요");
			int menu = 0;
			try { // try안에는 선언을 잘하지 않음
				String menuStr = sc.nextLine();
				menu = Integer.parseInt(menuStr); // 스트링을 인트로

			} catch (NumberFormatException e) {
				// 문자입력시 NumberFormatException
				// e.printStackTrace(); 스캐너를 통해 사용자에게 입력받았을때 생략가능
			}
			// if(!new KHCommonAPI().checkMenu(1, 5, menu)) {//static이 없을시
//			if(!KHCommonAPI.checkMenu(1, 5, menu)) {//static있을 시
			if (!checkMenu(1, 5, menu)) { // static이 붙어있기 때문에 static붙여서 임포트 (1.)
				continue;
			}
			// 정상입력경우
			System.out.println("정상적으로 입력되어서 다른 함수를 호출함.");
			testString();
			System.out.println("동작 마침!");
			break;
		}

//		while(true) {
//			System.out.print("메뉴 1-5사이 선택해주세요");
//			int menu = 0;
//			try { // try안에는 선언을 잘하지 않음
//				menu = sc.nextInt();
//			} catch(InputMismatchException e) {
//				//문자입력시 InputMismatchException
//				//e.printStackTrace();
//				sc.nextLine(); // 무조건 캐치부분에
//			}
//			if(menu < 1 || menu > 5) {
//				//비정상 입력경우
//				System.out.println("1 - 5 사이 선택해주세요.");
//				continue;
//			}
//			//정상입력경우
//			System.out.println("정상적으로 입력되어서 다른 함수를 호출함.");
//			testString();
//			System.out.println("동작 마침!");
//			break;
//		}

//		while(true) {
//		System.out.print("메뉴 1-5사이 선택해주세요");
//			int menu = sc.nextInt();
//		
//			if(menu > 0 && menu < 6) {
//			//정상입력경우
//				System.out.println("정상적으로 입력되어서 다른 함수를 호출함.");
//				testString();
//				System.out.println("동작 마침!");
//				break;\
//			} else {
//				//비정상 입력경우
//				System.out.println("1 - 5 사이 선택해주세요.");
//			}
//		}
		System.out.println("testWrapperDoWhile 종료");
	}

	public void testString() {

		StringBuffer str1 = new StringBuffer("aaa");
		StringBuffer str2 = new StringBuffer();
		str2.append("12345");
		str2.insert(2, "ABC");
		System.out.println(str2);
		System.out.println(str2.indexOf("BC"));
		StringBuilder str3 = new StringBuilder("bbb");
		str3.insert(1, "111");
		System.out.println(str3);

		System.out.println("=====================");

		Scanner sc = new Scanner(System.in);
		System.out.print("구분자를 입력해주세요.");
		String tk = sc.nextLine();
		System.out.print("내용을 입력해주세요.");
		String tk1 = sc.nextLine();
		String str = "A| | AA|B|BBB|CC";
		StringTokenizer st = new StringTokenizer(tk1, tk);
		while (st.hasMoreElements()) {
			System.out.println(st.nextToken());
		}

		int i = 35;
		double d = 35.0;
		String s1 = String.valueOf(i);
		String s2 = Double.valueOf(d).toString();

		// String --> 기본자료형
		String s = "35.456462";
		d = Double.parseDouble(s);
		System.out.println(d);

		System.out.println("=============");

		System.out.println(s1);
		System.out.println(s2 + ":");

		int bnum1 = 10;
		int bnum2 = 11;
		String bcontent2 = "aaa";
		String bwriter1 = "aa";
		bwriter1 = "bb";

		TestVo tv = new TestVo();
	}
}
