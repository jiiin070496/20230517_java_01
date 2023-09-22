package talktalk_final.lclass.talk.board.dto;

import java.util.List;

import org.springframework.stereotype.Component;

import talktalk_final.lclass.talk.common.PageDto;

@Component
public class BoardPage extends PageDto{
	private List<BoardDto> list;

	public List<BoardDto> getList() {
		return list;
	}

	public void setList(List<BoardDto> list) {
		this.list = list;
	}
}
