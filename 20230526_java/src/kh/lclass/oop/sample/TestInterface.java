package kh.lclass.oop.sample;

public interface TestInterface{
	
	public final int MAXCNT = 10;
	public  void method1();    //능력단위별 평가보기
	public  String method2();  // 평가 안내
	public  int method3(int a, int b);  // 평가 리뷰
//	public  int method3();  // 평가 리뷰

	
	//게시판
//	int insertBoard(Car vo); // value object - 사물, 자료를 담고있는 클래스
//	int deleteBoard(Car vo);
//	int updateBoard(Car vo);
//	Car selectOne(int boardNo);  //글 하나 선택
//	Car[] selectList();
//	Car[] selectListArr(String searchWord);
//	List<Car> selectList(String searchWord);
//	Car[] searchSelect(String Word);
}
