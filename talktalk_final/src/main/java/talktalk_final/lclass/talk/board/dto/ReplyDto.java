package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ReplyDto {
	
//	이름       널?       유형             
//			-------- -------- -------------- 
//			RNO      NOT NULL NUMBER         
//			BNO      NOT NULL NUMBER         
//			RCONTENT NOT NULL VARCHAR2(3000) 
//			RDATE    NOT NULL TIMESTAMP(6)   
//			REP      NOT NULL NUMBER         
//			REPS     NOT NULL NUMBER         
//			REPL     NOT NULL NUMBER         
//			MID      NOT NULL VARCHAR2(20)   
	private int rno;
	private int bno;
	private String rcontent;
	private String rdate;
	private int rep;
	private int reps;
	private int repl;
	private String mid;


}
