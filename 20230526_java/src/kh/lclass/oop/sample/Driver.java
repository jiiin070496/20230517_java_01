package kh.lclass.oop.sample;

public class Driver {
	private int license;
	private int money;
	
	public int getLicense() {
		return license;
	}

	public void setLicense(int license) {
		this.license = license;
	}

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	//자동차 구매
//	public void buy(Sonata c) {
//		if(money > c.getPrice()) {
//			System.out.println("구매확정");
//		} else {
//			System.out.println("잔액 부족");
//		}
//	}
//
	public void buy(Car c) {
		if(money > c.getPrice()) {
			//((Avante)c).moveAvante(); => 오류, instanceof 후에 다운캐스팅
			
			if(c instanceof Sonata) {
				((Sonata)c).moveCar();  //Car를 Sonata로 바꿔줌
				
				System.out.println("Sonata 이벤트에 응모되셨습니다. ");
			}
			if(c instanceof Car) {
				System.out.println("Car 이벤트에 응모되셨습니다.");
			}
			if(c instanceof Object) {
				System.out.println("Object 이벤트에 응모되셨습니다.");
			}
			
			System.out.println(c.getPrice() + "구매확정");
			money = money - c.getPrice();
			c.moveCar();
		} else {
			System.out.println("잔액 부족! . 현재 잔액은 " + money);
		}
	}

	//운전
	public void driving() {
		
	}

}
