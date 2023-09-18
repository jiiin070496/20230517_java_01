package talktalk_final.lclass.talk.board.dao;

import java.util.List;
import java.util.Map;


import talktalk_final.lclass.talk.board.dto.CommentDto;

public interface CommentDao {
	
	public int insertComment(Map<String, Object> paramMap);
	
	
}
