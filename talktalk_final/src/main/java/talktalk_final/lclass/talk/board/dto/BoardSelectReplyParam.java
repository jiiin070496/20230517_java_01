package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardSelectReplyParam {
	private int bno;
	private int selectReplyNo;
}
