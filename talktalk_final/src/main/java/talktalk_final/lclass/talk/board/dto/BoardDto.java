package talktalk_final.lclass.talk.board.dto;

import org.springframework.stereotype.Component;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;


@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
@ToString
@Component
public class BoardDto {

	private int bno;
	private String btitle;
	private String bcontent;
	private String mid;
	private String bwriteDate;
	private int readcnt;
	private String fileName;
	private String filePath;
	private int bref;
	private int breLevel;
	private int breStep;

}
