package talktalk_final.lclass.talk.board.service;

import talktalk_final.lclass.talk.board.dto.LikeDto;

public interface LikeService {
	public int likeCount(LikeDto dto) throws Exception;
	public int likeGet(LikeDto dto) throws Exception;
	public void likeInsert(LikeDto dto) throws Exception;
	public void likeUpdate(LikeDto dto) throws Exception;
}
