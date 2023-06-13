package kh.lclass.swing;

import java.awt.BorderLayout;
import java.awt.Container;
import java.awt.FlowLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;

import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JTextField;

public class TestSwing extends JFrame {
	
	public TestSwing() {
		setTitle("Hello Window 프레임");
		setDefaultCloseOperation(EXIT_ON_CLOSE); // X버튼 눌러서 resource 정리하고 창 닫기
		
		Container contentPane = getContentPane();//JFrame이 제공해주는 ContentPane;
		//contentPane.setLayout(new FlowLayout(FlowLayout.RIGHT, 5, 10));//물 흐르듯 하나씩 나타내겠다
//		contentPane.setLayout(new BorderLayout(20, 30));
//		contentPane.add(new JButton("ok"), BorderLayout.NORTH);
//		contentPane.add(new JButton("cancle"), BorderLayout.WEST);
//		contentPane.add(new JButton("ignore"), BorderLayout.EAST);
//		contentPane.add(new JButton("ignore"),  BorderLayout.CENTER);
//		contentPane.add(new JButton("ignore"),  BorderLayout.SOUTH);
		
		//component 생성
		JTextField txtName = new JTextField();
		JTextField txtNo = new JTextField();
		JTextField txtMajor = new JTextField();
		JTextField txtSub = new JTextField();
		JButton btnSave = new JButton("저장");
		
		//event 등록 = action 리스너 달기
		
		btnSave.addActionListener(new MyActionListener());
		txtName.addActionListener(new MyActionListener());
		
		
		contentPane.setLayout(new GridLayout(5, 2, 10, 10));
		contentPane.add(new JLabel("이름"));
		contentPane.add(txtName);
		
		contentPane.add(new JLabel("학번"));
		contentPane.add(txtNo);
		
		contentPane.add(new JLabel("학과"));
		contentPane.add(txtMajor);
		
		contentPane.add(new JLabel("과목"));
		contentPane.add(txtSub);	
		contentPane.add(btnSave);	
		
		setSize(300, 300);
		setVisible(true);//false 창을 안보이게함
	}
	public static void main(String[] args) {
		TestSwing frame = new TestSwing();
	}
}

class MyActionListener implements ActionListener{

	@Override
	public void actionPerformed(ActionEvent e) {
		System.out.println("이건 언제 호출되지?");
		System.out.println(e);
		Object source = e.getSource();
		if(source instanceof JButton) {
			System.out.println("button 눌렀네요");
			
			if(((JButton)source).getText().equals("저장")) {
				((JButton)source).setText("Save");
			}else {
				((JButton)source).setText("저장");
			}
			
		}else if (source instanceof JTextField) {
			System.out.println("text 필드에서 엔터키를 누르셨네요");
		}
	}
	
}























