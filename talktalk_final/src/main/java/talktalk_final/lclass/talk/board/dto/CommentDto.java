package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.Data;


//RNO      NOT NULL NUMBER         
//BRE               NUMBER         
//BNO      NOT NULL NUMBER         
//RCONTENT NOT NULL VARCHAR2(3000) 
//RDATE    NOT NULL TIMESTAMP(6)   
//BREL     NOT NULL NUMBER         
//BRES     NOT NULL NUMBER         
//MID      NOT NULL VARCHAR2(20) 

@Data
@Component
public class CommentDto {
	private int rno;
	private int bre;
	private int bno;
	private String rcontent;
	private String rdate;
	private int brel;
	private int bres;
	private String mid;
}
