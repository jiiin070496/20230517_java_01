package talktalk_final.lclass.talk.board.service;

import java.util.List;


import talktalk_final.lclass.talk.board.dto.BoardDto;


public interface BoardService {
	public List<BoardDto> selectList()throws Exception;
	public BoardDto selectOne(int bno)throws Exception;
	public int insert(BoardDto dto)throws Exception;
	public int update(BoardDto dto)throws Exception;
	public int delete(int bno)throws Exception;	
/* ---------------Paging--------------- */
//	public BoardPage selectOne(BoardPage page) throws Exception;
/* ---------------답글 관련--------------- */	
//	public List<BoardDto> reply_list()throws Exception;
//	public int reply_insert(BoardDto dto)throws Exception;
	
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
