package kh.lclass.io;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class TestFileIO {
	public void testFile() /* throws IOException */ {
//		File f1 = new File("D:/data1/aaa.txt");
//		f1.mkdirs();
		String path = "D:/data2/test";
		String filename = "aaa.txt";
		new File(path).mkdirs();
		File f2 = new File(path, filename);
		// Unhandled exception type IOException
		FileWriter fw = null; 
		try {			
			f2.createNewFile();
			
			fw = new FileWriter(f2);
			fw.write("abcdefg");
			fw.flush();
			return;
		} catch(IOException e) {
			System.out.println("파일 생성 못함");
			e.printStackTrace();
		} finally {			
			try {			
				if(fw!=null) fw.close(); // 너무도 많이 쓰기때문에 1줄 코딩
			} catch(IOException e) {
				e.printStackTrace();
			} 
		}
	}
}
