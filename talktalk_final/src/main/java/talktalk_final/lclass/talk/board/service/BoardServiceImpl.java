package talktalk_final.lclass.talk.board.service;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import talktalk_final.lclass.talk.board.dao.BoardDao;
import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.BoardPage;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardDao boardDao;

	@Override
	public List<BoardDto> selectList() throws Exception{
		 return boardDao.selectList();
	}

	@Override
	public BoardDto selectOne(int bno) throws Exception{
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
	public BoardPage selectOne(BoardPage page) throws Exception {
		return boardDao.selectOne(page);
	}
	
	@Override
	public int reply_insert(BoardDto dto) throws Exception {
		 BoardDto returnVo = boardDao.insert(dto); 
		 int result = returnVo.getBno();
		 return result;
	}
	
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
