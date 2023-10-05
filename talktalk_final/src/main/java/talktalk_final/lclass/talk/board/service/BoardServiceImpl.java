package talktalk_final.lclass.talk.board.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Transactional;

import talktalk_final.lclass.talk.board.dao.BoardDao;
import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.LikeDto;

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
	public void doLike(LikeDto lDto) throws Exception {
		int myLikeCount = boardDao.getMyLikeCount(lDto);
		if(myLikeCount < 1) {
			boardDao.doLike(lDto);
		}else {
			boardDao.deleteLike(lDto);
		}
	}

	@Override
	public int getMyLikeCount(LikeDto lDto) throws Exception {
		return boardDao.getMyLikeCount(lDto);
	}

	@Override
	public int getTotalLikeCount(int bno) throws Exception {
		return boardDao.getTotalLikeCount(bno);
	}

	@Override
	public void deleteLike(LikeDto lDto) throws Exception {
		boardDao.deleteLike(lDto);
		
	}

	@Override
	public int boardReadCnt(int bno) throws Exception {
		return boardDao.boardReadCnt(bno);
	}
	
	@Override
	public int count() throws Exception{
		return boardDao.count();
	}
	
	@Override
	public List<BoardDto> listPage(int displayPost, int postNum) throws Exception {
	 return boardDao.listPage(displayPost, postNum);
	}
		
}

