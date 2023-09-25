package talktalk_final.lclass.talk.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import talktalk_final.lclass.talk.board.dao.BoardDao;
import talktalk_final.lclass.talk.board.dto.BoardDto;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardDto> selectList() throws Exception{
		 return boardDao.selectList();
	}
	
	@Transactional(isolation = Isolation.READ_COMMITTED)
	@Override
	public BoardDto selectOne(int bno) throws Exception{
		boardDao.boardReadCnt(bno);
		return boardDao.selectOne(bno);
	}

	@Override
	public int insert(BoardDto dto) throws Exception {
		 BoardDto returnVo = boardDao.insert(dto); 
		 int result = returnVo.getBno();
		 return result;
	}

	@Override
	public int update(BoardDto dto) throws Exception {
		 return boardDao.update(dto);
	}

	@Override
	public int delete(int bno) throws Exception {
		return boardDao.delete(bno);
	}
	
	@Override
	public int findLike(int bno, String mid) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("board_no", bno);
		map.put("user_no", bno);
		return boardDao.findLike(map);
	}
	
	@Override
	public void likeUp(int bno, String mid, int like_type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("mid", mid);
		map.put("like_type", like_type);
		boardDao.likeUp(map);
	}
	@Override
	public void likeDown(int bno, String mid, int like_type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("mid", mid);
		map.put("like_type", like_type);
		boardDao.likeDown(map);
	}
	@Override
	public int getLike(int bno, int like_type) throws Exception {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("bno", bno);
		map.put("like_type", like_type);
		return boardDao.getLike(map);
	}	
		
//	@Override
//	public BoardPage selectOne(BoardPage page) throws Exception {
//		return boardDao.selectOne(page);
//	}
//	
//	@Override
//	public List<BoardDto> reply_list()throws Exception {
//		return boardDao.reply_list();
//	}
//	
//	@Override
//	public int reply_insert(BoardDto dto) throws Exception {
//		 BoardDto returnVo = boardDao.insert(dto); 
//		 int result = returnVo.getBno();
//		 return result;
//	}
	
}
//	  public List<BoardDto> selectList() throws Exception{ return
//	  boardDao.selectList(); } public BoardDto selectOne(int bno) throws Exception{
//	  return boardDao.selectOne(bno); }
//	  
//	  @Transactional // 바로 밑에있는 메소드 하나에만 영향을 줌 public int insert(BoardDto dto)
//	  throws Exception{ BoardDto returnVo = boardDao.insert(dto); int result =
//	  returnVo.getBno(); return result; }
//	  
//	  public int update(BoardDto dto) throws Exception{ return
//	  boardDao.update(dto); } public int delete(int bno) throws Exception{ return
//	  boardDao.delete(bno); }
