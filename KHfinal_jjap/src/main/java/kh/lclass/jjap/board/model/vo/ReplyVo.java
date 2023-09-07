package kh.lclass.jjap.board.model.vo;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ReplyVo {
//	RNO      NOT NULL NUMBER         
//	BNO      NOT NULL NUMBER         
//	RCONTENT NOT NULL VARCHAR2(3000) 
//	RDATE    NOT NULL TIMESTAMP(6)   
//	GRP      NOT NULL NUMBER         
//	GRPS     NOT NULL NUMBER         
//	GRPL     NOT NULL NUMBER         
//	MID      NOT NULL VARCHAR2(20) 
	
	private String rno;
	private String bno;
	private String rcontent;
	private String rdate;
	private int grp;
	private int grps;
	private int grpl;
	private String mid;
}
