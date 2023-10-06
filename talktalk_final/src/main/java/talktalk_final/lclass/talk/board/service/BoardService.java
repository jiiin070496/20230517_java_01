package talktalk_final.lclass.talk.board.service;

import java.util.List;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.Page;


public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;

// 좋아요 갯수 증감
	public int totalLike(int bno) throws Exception;
	public int totalLikeCancel(int bno) throws Exception;
	
// 게시물 목록 + 페이징
	public int count() throws Exception;
	public List<BoardDto> listPage(Page page) throws Exception;
}

