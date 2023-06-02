package kh.lclass.oop.sample;

import java.util.ArrayList;
import java.util.Collection;
import java.util.LinkedList;
import java.util.List;

public class TestPolymophism {
	public static void main(String[] args) {
		
		ArrayList<Car> carArrList = new ArrayList<Car>(); //implements - 구체화
		List<Car> carList = new ArrayList<Car>();  //가장 많이 선언하는 방식
		List<Car> carList2 = new LinkedList<Car>();  //가장 많이 선언하는 방식
		Collection<Car> carCollection = new ArrayList<Car>();
		
		
		//오류 new TestInterface
		TestInterface kh = new kh();
		kh kh2 = new kh(); //TestInterface, kh 다 사용가능
		
		((kh)kh).khSpecial();
		
		
		TestInterface bit;
		TestInterface bit2;
		kh2.khSpecial();
		kh2.method1();
		
		
		Driver ej = new DriverSub();
		ej.setMoney(10000);
		ej.buy(new Sonata());
		ej.buy(new Avante());
		
		Driver jh = new Driver2Sub();
		jh.setMoney(10000);
		jh.buy(new Sonata());
		jh.buy(new Avante());
		
	}
}
