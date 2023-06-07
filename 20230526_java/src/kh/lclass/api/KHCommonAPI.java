package kh.lclass.api;

public class KHCommonAPI {
	public static boolean checkMenu(int start, int end, int value) {// 함수를 호출하는 기본모양
		boolean result = false;
		if (value < start || value > end) {
			// 비정상 입력경우
			System.out.printf("%d - %d 사이 선택해주세요.\n", start, end);
		}else {
			//정상입력
			result = true;
		}
		return result;
	}

}
