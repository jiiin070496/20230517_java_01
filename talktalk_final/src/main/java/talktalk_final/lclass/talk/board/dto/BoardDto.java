package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.Data;

@Data
@Component
public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private String bwriteDate;
	private String mid;
	private int bref;
	private int breLevel;
	private int breStep;

}
