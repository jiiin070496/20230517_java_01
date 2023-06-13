package kh.lclass.udp;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;

public class UdpEchoSender {
	public static void main(String[] args) {
		new UdpEchoSender().senderUdp();
	}

	public void senderUdp() {
		// 1. 내 포트번호 정하기(2개)
		int myPort = 5001; // 내 포트
		int destPort = 6001; // 상대방포트
		String destName = "localhost";
		DatagramSocket dSock = null;
		BufferedReader br = null;
		// 2. datagramSocket 객체 생성
		try {
			dSock = new DatagramSocket(myPort); // 매개인자 없으면 자동 port번호 할당, 지정하면 해당 포트번호로 소켓생성

			br = new BufferedReader(new InputStreamReader(System.in));

			while (true) {
				// 전달할 메시지.
				System.out.println("입력 > ");
				String sendMsg = br.readLine(); // 콘솔 입력받음

				// exit 입력하면 프로그램 끝내기
				if (sendMsg.equals("exit")) {
					break;
				}
				// 메시지 전달
				InetAddress destIp = null;

				try {
					// 메시지 전달
					// 3. 연결한 클라이언트 ip주소를 가진 InetAddress 객체생성
					destIp = InetAddress.getByName(destName);

					// 4. 전송할 메시지를 byte[]로 바꿈
					byte[] byteMsg = sendMsg.getBytes();

					// 5. 전송할 메시지를 DatagramPacket 객체에 담음
					DatagramPacket sendData = new DatagramPacket(byteMsg, byteMsg.length, destIp, destPort);

					// 6.소켓 레퍼런스를 사용하여 메시지 전송
					dSock.send(sendData);

				} catch (UnknownHostException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
				// 메시지 수신
				byte[] byteMsg = new byte[1000];
				DatagramPacket receivedData = new DatagramPacket(byteMsg, byteMsg.length);
				dSock.receive(receivedData);
//				System.out.println("===정달받은 정보들 = ");
//				System.out.println(byteMsg.length); // 받은 "안녕" 의 길이
//				System.out.println(receivedData.getData().length);
//				System.out.println(receivedData.getLength());
//				System.out.println(receivedData.getAddress()); // 전달받은 메시지의 발신IP
//				System.out.println(receivedData.getPort());// 전달받은 메시지의 발신 port

				String receivedStr = new String(receivedData.getData()); // 바이트 배열을 스트링으로
				System.out.println("Echo메시지: " + receivedStr);

			}

		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
				try {
					if (br != null) br.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			if (dSock != null)
				dSock.close();
		}
	}

}
