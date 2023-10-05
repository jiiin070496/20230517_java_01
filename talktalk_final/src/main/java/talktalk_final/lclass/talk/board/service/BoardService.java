package talktalk_final.lclass.talk.board.service;

import java.util.List;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.Criteria;
import talktalk_final.lclass.talk.board.dto.LikeDto;
import talktalk_final.lclass.talk.common.PageDto;


public interface BoardService {
// BOARD
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;
	public int boardReadCnt(int bno) throws Exception;

// LIKE
	public void doLike (LikeDto lDto)throws Exception;
	public int getMyLikeCount (LikeDto lDto)throws Exception;
	public int getTotalLikeCount (int bno)throws Exception;
	public void deleteLike (LikeDto lDto)throws Exception;

// PAGING
	public List<BoardDto> listPage(Criteria cri) throws Exception
	
	//게시글 총 갯수
	public int count() throws Exception;
}

