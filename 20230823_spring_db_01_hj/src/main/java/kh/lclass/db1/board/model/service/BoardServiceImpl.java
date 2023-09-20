package kh.lclass.db1.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kh.lclass.db1.board.model.dao.BoardDao;
import kh.lclass.db1.board.model.vo.BoardVo;


@Service
public class BoardServiceImpl implements BoardService{
	@Autowired
	private BoardDao boardDao;
	
	@Override
	public List<BoardVo> selectList() throws Exception {
		return boardDao.selectList();
	}

	@Override
	public BoardVo selectOne(int bno) throws Exception {
		return boardDao.selectOne(bno);
	}

	@Override
	public BoardVo insert(BoardVo vo) throws Exception {
		BoardVo returnVo = boardDao.insert(vo);
		int result = returnVo.getBno();
		return result;
	}
	
}
