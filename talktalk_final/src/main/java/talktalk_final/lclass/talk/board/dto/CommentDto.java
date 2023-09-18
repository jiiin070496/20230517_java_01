package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.Data;


@Data
@Component
public class CommentDto {
	private String rno;
	private String bno;
	private String pno;
	private String  depth;
	private String rcontent;
	private String mid;
	private String  rdate;
}
