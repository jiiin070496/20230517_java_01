package talktalk_final.lclass.talk.board.service;

import java.util.List;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.LikeDto;


public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;
	public int boardReadCnt(int bno) throws Exception;
	public void doLike (LikeDto lDto)throws Exception;
	public int getMyLikeCount (LikeDto lDto)throws Exception;
	public int getTotalLikeCount (int bno)throws Exception;
	public void deleteLike (LikeDto lDto)throws Exception;
	public int count() throws Exception;
	// 게시물 목록 + 페이징
	public List<BoardDto> listPage(int displayPost, int postNum) throws Exception;
}

//@Autowired
//private BoardDao boardDao; 
//
//public List<BoardDto> selectList() throws Exception{
//	return boardDao.selectList();
//}
//public BoardDto selectOne(int bno) throws Exception{
//	return boardDao.selectOne(bno);
//}
//@Transactional // 바로 밑에있는 메소드 하나에만 영향을 줌 
//public int insert(BoardDto dto) throws Exception{
//	BoardDto returnVo = boardDao.insert(dto);
//	int result = returnVo.getBno();
//	return result;
//}
//
//public int update(BoardDto dto) throws Exception{
//	return boardDao.update(dto);
//}
//public int delete(int bno) throws Exception{
//	return boardDao.delete(bno);
//}
