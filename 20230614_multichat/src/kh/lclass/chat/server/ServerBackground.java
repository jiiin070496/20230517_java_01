package kh.lclass.chat.server;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.net.UnknownHostException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import kh.lclass.chat.Client.ClientGUI;

public class ServerBackground {
	private ServerSocket ServerSocket;
	private ServerGUI gui;

	// client 여러명을 관리 : key(nickname), value(OutputStream)
	private Map<String, BufferedWriter> mapClients = new HashMap<String, BufferedWriter>();
	// map.put("socket", socket);
	// map.put("nickname","받아온 닉네임" )
	private Socket socket;
	
	private int count; // 현재 접속자 수

	// 서버 생성 및 설정
	public void setting() {
		try {
			ServerSocket = new ServerSocket(7777); // 클라이언트와 같은 포트넘버
			// 멀티챗이기때문에 여러명의 접속을 받아들임. gui프로그램의 경우 창 닫힐때까지 무한반복, break없음
			while (true) {
				// 접속자 대기 하다가
				socket = ServerSocket.accept(); // 클라이언트 받음
				new Client(socket).start();;
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	// 클라이언트 접속하면 그 정보를 나타내주는 메소드.
	public void addClient(String nickname) {
		gui.appendMsg(nickname + "님이 접속했습니다.\n");
	}

	public void setGui(ServerGUI gui) {
		this.gui = gui;
	}
	
	public void sendMessage(String msg) {
		//Client들 모두에게 msg 전달
		Set<String> keys = mapClients.keySet();
		for(String key : keys) {
			BufferedWriter wr = mapClients.get(key);
			try {
				wr.write(msg);
				wr.flush();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/////////////////////////////	 Inner Class    ///////////////////////////////

	class Client extends Thread {
		//private Socket socket;
		private BufferedReader br;
		private BufferedWriter bw;
		private String nickname;
		public Client(Socket socket) {
			//초기값 설정
			//client와 입/출력 통로생성
			try {
				br = new BufferedReader(new InputStreamReader(socket.getInputStream()));
				bw = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream()));
				// 클라이언트nickname이 바로 이어서 들어옴
				// 접속이 되면 바로 nickname이 전달될 것이므로 읽음
				String nickname = br.readLine(); // br -> run에서 관리
				// server 화면에 표현
				addClient(nickname);
				// client outputStream 관리 map에 추가
				mapClients.put(nickname, bw);
				
				//client map 모구에세 접속 정보 전달
				sendMessage(nickname + "님 접속했습니다.\n");
			} catch (IOException e) {
				e.printStackTrace();
			}

		}
		@Override
		public void run() {
			// 클라이먼트들 각각에서 전달되어오는 메시지 확인 후 출력			
			// 클라이언트와 입력 통로가 끊어지지 않았다면 계속 반복
			// 클라이언트에서 수신받은 msg
			while (br != null) {
				try {
					String msg = br.readLine();
					gui.appendMsg(msg);
					//client map 모구에세 접속 정보 전달
					sendMessage(msg);
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}
	}
}


































