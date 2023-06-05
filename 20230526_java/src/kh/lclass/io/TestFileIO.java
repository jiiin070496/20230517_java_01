package kh.lclass.io;

import java.io.BufferedReader;
import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.ObjectInput;
import java.io.ObjectInputStream;
import java.io.ObjectOutput;
import java.io.ObjectOutputStream;

import kh.lclass.exception.UserException;
import kh.lclass.oop.sample.Person;

public class TestFileIO {
	String filePath = "D:/data2/test/aaa.txt";

	public void testFileOutPutStreamObject() {

		Person p1 = new Person("홍길동", 23, '남', 0);
		Person p2 = new Person("영희", 27, '여', 0);

		String filePath = "D:/data2/test/aaa.txt";
		FileOutputStream fos = null; // 기반스트림
		ObjectOutputStream oos = null; // 보조스트림
		try {
			fos = new FileOutputStream(filePath);
			oos = new ObjectOutputStream(fos);
			oos.writeObject(p1);
			oos.writeObject(p2);
			oos.flush();

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				if (oos != null) oos.close();
				if (fos != null) fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	public void testFileInPutStreamObject() {

		String filePath = "D:/data2/test/aaa.txt";
		FileInputStream ios = null; // 기반스트림
		ObjectInputStream ois = null; // 보조스트림
		try {
			ios = new FileInputStream(filePath);
			ois = new ObjectInputStream(ios);
			
			if(ois.readObject() instanceof Person) {
				Person a = (Person)(ois.readObject());
				//Person b = (Person)(ois.readObject());
				System.out.println(a);
				//System.out.println(b);
				}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} finally {
			try {
				if (ois != null)
					ois.close();
				if (ios != null)
					ios.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

	}

	public void testFileReadData(){
		String filePath = "D:/data2/test/aaa.txt";
		try(DataInputStream dis = new DataInputStream(new FileInputStream(filePath));){
			long temp = 0L;
			while(temp = dis.readLong() != 0) {
				System.out.println(String.valueOf(temp));
			} catch(IOException e) {
				e.printStackTrace();
			}
	}

	public void testFileRead3() {
//		String filePath = "D:/data2/test/aaa.txt";
		try (BufferedReader br = null; FileInputStream fis = null; InputStreamReader isr = null;)

		{
			String str = null;
			while ((str = br.readLine()) != null) {
				System.out.println(str);
			}
		}
//		br = new BufferedReader(new filepath);
		catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	public void testRamda() throws UserException {
		int[] arr = { 2, 3, 4, };
		int[] arr2 = new int[] { 2, 3, 4 };
		for (int i = 0; i < arr.length; i++) {
			System.out.println(arr[i]);
		}
		if (arr.length > 2) {
			new UserException();
			throw new UserException("배열의 크기는 2보다 크면안됨. 줄여주세요.");

		}
	}

	public void testFileRead2() {
		// 보조스트림
		String filePath = "D:/data2/test/aaa.txt";
		// 선언
		FileInputStream fis = null;
		InputStreamReader isr = null;
		BufferedReader br = null;
		try {
			// 생성, 생성순서 : 기반스트림 --> 보조스트림
			fis = new FileInputStream(filePath);// 통로 - 기반 , 바이트를
			isr = new InputStreamReader(fis);// 통로 - 보조, 문자로 바꾸는 보조 스트림
			br = new BufferedReader(isr);// 성능향상을 하는 보조스트림
			// 줄여서 나타내기
//			isr = new InputStreamReader(new FileInputStream(filePath));
//			br = new BufferedReader(new InputStreamReader(new FileInputStream(filepath)));

			String str = null;
			while ((str = br.readLine()) != null) {
				System.out.println(str);
			}

		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				// 해제순서(생성반대순서): 보조스트림 --> 기반스트림
				if (br != null)
					br.close();
				if (isr != null)
					isr.close();
				if (fis != null)
					fis.close();// close 순서는 생성된 순서와 반대로

			} catch (IOException e2) {
				e2.printStackTrace();
			}
		}
	}

	public void testFileRead() { // 파일이 없을떄 읽는 방법
		String filePath = "D:/data2/test/aaa.txt";
		FileReader fr = null; // 지역변수는 초기값을 작성해줌
		try {
			fr = new FileReader(filePath); // (file과 java 프로그램의 resource 통로)
			// Unhandled exception type IOException
			// for(int i = 0; i<fr.) index없어서 사용불가
			// 방법 1
//				int a = -1;
//				while((a = fr.read()) > -1) {//a = fr.read()를 먼저 연산하기위해()
//					System.out.println((char)a);
//				}

			// 방법 2 - 3
			int cntPerRead = 30;
			char[] readCharArr = new char[1000];
			for (int i = 0; i < readCharArr.length / cntPerRead; i++) {
				int readCnt = fr.read(readCharArr, i * cntPerRead, cntPerRead); // (2) offSet만큼 띄움, space bar형태의 null값
				System.out.println(readCnt); // 문자 4개 읽음 (한글 한)
				if (readCnt < cntPerRead) {
					break;
				}
			}
			System.out.println(readCharArr);

		} catch (FileNotFoundException e) {
			e.printStackTrace();
			System.out.println("파일을 찾을 수 없습니다. 경로를 확인해주세요.");
		} catch (IOException e) {
			e.printStackTrace();
			// Unreachable catch block for FileNotFoundException.
			// It is already handled by the catch block for IOException
		} finally {
			try {
				if (fr != null)
					fr.close(); //
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		System.out.println("== testFileRead 끝 ==");
	}

	public void testFile() /* throws IOException */ {
//		File f1 = new File("D:/data1/aaa.txt");
//		f1.mkdirs();
		String path = "D:/data2/test";
		String filename = "aaa.txt";

		new File(path).mkdirs();// 디랙토리 생성
		File f2 = new File(path, filename);
		// Unhandled exception type IOException
		FileWriter fw = null;
		try {
			f2.createNewFile();// 파일 생성

			fw = new FileWriter(f2); // File에 문자형태 전송이 가능한 출력 OutputStream(File과 java 프로그램의 통로)
			fw.write("한글 한");// 전송하고자 하는 문자
			fw.flush();// 전송한 문자가 남긴 버퍼를 깨끗하게 밀어내기
			return;
		} catch (IOException e) {
			System.out.println("파일 생성 못함");
			e.printStackTrace();
		} finally {// return전에 반드시 실행하고 넘어가는 문구
			try {
				if (fw != null)
					fw.close(); // 통로를 닫기
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}
