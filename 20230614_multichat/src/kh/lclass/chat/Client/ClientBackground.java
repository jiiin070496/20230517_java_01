package kh.lclass.chat.Client;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.Socket;
import java.net.UnknownHostException;

public class ClientBackground {
	private Socket socket; // 필드에 선언된 Socket은 garbage collection에 의해 close됨.
	private BufferedReader br; //입력통로
	private BufferedWriter bw;
	private String nickname; // 클라이언트 이름
	private ClientGUI gui; //null값 // = new X,  
	
	
	
	// garbage collectiond없이 client가 서버와 접속 끊기
	public void disconnection() {
		try {
			if (socket != null) {
				socket.close();
			}
		} catch (Exception e) {
		}
	}

	// client가 서버에 접속
	public void connection() {
		try {
			// 서버와 연결
			socket = new Socket("127.0.019.1", 7777); // ip-localhost라고 적어도 됨
			// 서버와 입/출력 통로(br, bw) 생성
			br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
			bw = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
			//접속되면 바로 나의 nickname 전송
			System.out.println("[냄궁]-2" + nickname);
			bw.write(nickname + "\n");
			bw.flush();
			
			// server와 입력 통로가 끊어지지 않았다면 계속 반복 확인함
			// server에서 수신받은 msg
			while(br != null) {
				String msg = br.readLine(); // 메시지를 꺼내서 넣고 appenMsg에 전달
				gui.appendMsg(msg);
				
			}
		} catch (UnknownHostException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	public void sendMessage(String msg) {
		// server에 msg전달
		try {
			System.out.println("[냄궁]-3" + nickname);
			bw.write(nickname + ": "+ msg + "\n");
			bw.flush();
			gui.appendMsg(msg);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	// 닉네임 setter
	public void setNickname(String nickName) {
		System.out.println("[냄궁]-4" + nickname);
		this.nickname = nickName;
	}
	
	public void setGui(ClientGUI gui) {
		this.gui = gui;
	}
}