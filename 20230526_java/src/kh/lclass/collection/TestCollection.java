package kh.lclass.collection;

import java.awt.RenderingHints.Key;
import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;
import java.util.Stack;

import kh.lclass.oop.sample.Car;

public class TestCollection {

	public <E extends Number, J> String testGeneric(E a, J b) {
		System.out.println(a.getClass().getName()); //클래스의 이름.
		System.out.println(b.getClass().getName()); //클래스의 이름.
		return a.toString() + "결과값";
	}
	
	public void testStack() {
	Stack<String> strStack = new Stack<String>();			
	strStack.push("냄궁"); //Stack은 push를 이용해서 값을 넣음.
	strStack.add("소은");
	strStack.push("바부");
	System.out.println(strStack.get(1)); //하나만 꺼내고 싶을때 .get
	System.out.println(strStack);
	System.out.println(strStack.peek()); //.peek(확인용), 보단 .get을 주로 사용
	System.out.println(strStack);
	System.out.println(strStack.pop()); //마지막에 들어온 값을 꺼내고 없앰.
	System.out.println(strStack);
	
	}
	
	public void testHashMap() {
		Map<String, Object> objMap = new HashMap<String, Object>(); // <>안에는 자료형을 넣어줌, K(key) = String만 쓰여짐, V = object
		objMap.put("ej", 35.0); // Object자리에 참조형 Double로쓰임, null 들어감
		objMap.put("yj", "지영이네");
		objMap.put("hj", new Car().getPrice());
		System.out.println(objMap.toString());
		System.out.println("ej" + ":" + objMap.get("ej")); // .get - 하나의 값만 꺼내고 싶을때
		Set<String> KeySet = objMap.keySet(); //.keySet - 키 값을 찾아옴
		System.out.println(KeySet);
		System.out.println("====Map : enhanced for ====");
		for (String item : KeySet) {
			Object value = objMap.get(item);
			System.out.println(item + ":" + value);

		}
		System.out.println("====Map : Iterator for ====");
		Iterator<String> itr = KeySet.iterator();
		System.out.println(itr);
		while (itr.hasNext()) { // iterator시 while문
			String item = itr.next();
			Object value = objMap.get(item);
			System.out.println(item + ":" + value);
		}


	}

	public void testHashSet() {
		Set<Integer> integerSet = new HashSet<Integer>();
		integerSet.add(11);
		integerSet.add(22);
		integerSet.add(33);
		integerSet.add(11); // 중복된건 하나로 취급
		System.out.println(integerSet.toString());

		System.out.println("=====Set enhanced for =====");
		for (Integer item : integerSet) {
			System.out.println(item);
		}
		System.out.println("===== Set : Iterator 사용 =====");
		Iterator<Integer> itr = integerSet.iterator();// 1.이터레이터 모양으로 변환해서 돌려줌 2.map에서 쓰임
		System.out.println(itr);
		while (itr.hasNext()) { // iterator시 while문
			Integer item = itr.next();// 출력
			System.out.println(item);
		}
	}

	public void testArrayList(int String) {
		String[] strArr1 = new String[3];
		strArr1[0] = "바나나";
		strArr1[1] = "딸기";
		// strArr1[3] = "수박";
		strArr1.clone();

		List<String> list1 = new ArrayList<String>();
		ArrayList<Integer> list2 = new ArrayList<Integer>();
		ArrayList<Car> list3 = new ArrayList<Car>();
		list3.add(new Car(3000));
		list2.add(25);
		list2.add(26);
		list2.add(27);
		// list2.add(10, 56); // 끼워넣기 insert index 현재 크키 size() 보다 클 수 없음.
		//// get(1000) 오류 = IndexOutOfBoundsException: Index 1000 out of bounds for
		// length 3
		// System.out.println(list2.get(1000));
//		System.out.println(list2.get(2));
//		System.out.println(list2.get(4));

		// 배열 = for문과 짝꿍
		// List의 for
		for (int i = 0; i < list2.size(); i++) {
			Integer item = list2.get(i);
			System.out.println(list2.get(i));
		}
		System.out.println("============");

		// }
		// for(int i = 0; i < list1.size(); i++) {
		// System.out.println(list1.get(i));
		// }
		// 배열의 for
		for (int i = 0; i < strArr1.length; i++) {
			String item = strArr1[i];
			System.out.println(strArr1[i]);
		}
		System.out.println("============");

//		for(int i = 0; i < strArr1.length; i++) {
//			System.out.println(strArr1[i]);
//		}

		// enhanced(한단계 업그레이드 된) for - 원래쓰던것보다 줄여서.
		for (Integer item : list2) { // list2의 사이즈 크기까지 반복
			System.out.println(item);
		}

		for (String item : strArr1) { // strArr의 사이즈 크기까지 반복
			System.out.println(item);
		}

		if (list1.add("7번")) {
			System.out.println("list1에 추가 성공했습니다.");
		}
		list1.add("2번");
		list1.add("1번");
		list1.add("3번");
		list1.add(1, "2번대신 끼워넣기");
		Collection<String> collection1 = new ArrayList<String>();
		collection1.add("2번");
		// collection1.add("3번");
		list1.removeAll(collection1);

		((ArrayList<String>) list1).clone();
		if (list1 instanceof ArrayList) {
			@SuppressWarnings("unchecked")
			ArrayList<String> copyList = (ArrayList<String>) (((ArrayList<String>) list1).clone()); // .clone -
																									// 오브젝트클래스에서 제공.
			System.out.println(copyList);
		}

		// list.remove("2번"); //remove(Object) - "2번"이라는 값만 삭제
		// list.remove(0); //삭제하고싶다!, 삭제하고 다음 번호가 0번이 됨.
		// list.clear(); //전체삭제.
		System.out.println(list1);
	}


}
