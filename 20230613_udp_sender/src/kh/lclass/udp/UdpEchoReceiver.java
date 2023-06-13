package kh.lclass.udp;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;

public class UdpEchoReceiver {
	public static void main(String[] args) {
		new UdpEchoReceiver().receiverUdp();
	}
	public void receiverUdp() {
		//1. 내 포트번호 정하기
		int myPort = 6001; // 내 포트
		//int destPort = 5001; // 받는용도로만 쓸땐 상대방 포트 필요없음
		DatagramSocket dSock = null;
		
		try {
			//2. datagramSocket 객체 생성
			dSock = new DatagramSocket(myPort);
			
			//메시지 수신 - 반복적으로 받아야하므로
			while(true) {
				byte[] byteMsg = new byte[1000];
				DatagramPacket receivedData 
				= new DatagramPacket(byteMsg, byteMsg.length);
				dSock.receive(receivedData);
				
//				System.out.println("===전달받은 정보들 = ");
//				System.out.println(byteMsg.length); // 받은 "안녕" 의 길이
//				System.out.println(receivedData.getData().length); 
//				System.out.println(receivedData.getLength()); 
//				System.out.println(receivedData.getAddress()); // 전달받은 메시지의 발신IP
//				System.out.println(receivedData.getPort());// 전달받은 메시지의 발신 port
				
				String receivedStr = new String(receivedData.getData()); //바이트 배열을 스트링으로
				System.out.println("수신메시지: " + receivedStr);
			
				//받은 메시지를 Echo 메시지 송신(다시 상대방에게) //sendUdp의 3.
				DatagramPacket sendData 
				= new DatagramPacket
				(receivedData.getData(), receivedData.getLength(), 
				receivedData.getAddress(), receivedData.getPort());
				
				dSock.send(sendData);

			}
			
			
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
}
