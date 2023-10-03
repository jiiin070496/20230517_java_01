package talktalk_final.lclass.talk.reply.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class ReplyDto {
	private int replyNo;
	private String memberId;
	private String replyContent ;
	private String replyDate;
	private int boardNo;
	private int rref;
	private int rstep;
	private int rlevel;
}
