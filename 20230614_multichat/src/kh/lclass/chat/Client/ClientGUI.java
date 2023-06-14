package kh.lclass.chat.Client;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Font;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JFrame;
import javax.swing.JTextArea;
import javax.swing.JTextField;

public class ClientGUI extends JFrame implements ActionListener {
	private static final long serialVersionUID = 2463446062892953051L;
	private JTextArea jta = new JTextArea(30, 30);
	private JTextField jtf = new JTextField(30);
	
	private String nickname; // 클라이언트 닉네임
	private ClientBackground cb = new ClientBackground(); // 채팅socket 기능을 담당할 객체

	public ClientGUI(String nickname) {
		this.nickname = nickname;
		
		// 생성자에서는 초기화 (즉, 화면 초기화)
		setBounds(200, 100, 400, 600);
		setTitle(nickname + "님의 chat");

		jta.setEditable(false);
		jta.setFont(new Font("맑은 고딕", Font.BOLD, 18));
		jta.setBackground(new Color(230, 255, 230));

		add(jta, BorderLayout.CENTER);
		add(jtf, BorderLayout.SOUTH);

		jtf.addActionListener(this);
		setDefaultCloseOperation(EXIT_ON_CLOSE);
		setVisible(true);
		
		cb.setNickname(nickname);
		cb.setGui(this);
		cb.connection();
	}

	// TODO 새 메시지를 받았을때 메소드 호출됨.
	public void appenMsg(String msg) {
		// jta (채팅창)에 msg를 추가함
		jta.append(msg);
	}

	@Override
	public void actionPerformed(ActionEvent e) {
		String msg = jtf.getText(); // 입력한 글 꺼내고싶을때
		System.out.println(msg + "\n");
		jtf.setText(""); // 입력창에 입력된 글을 초기화
		// TODO Server에 전달하기 위해 ClientBackground에 전달
		cb.sendMessage(msg);
	}
}
