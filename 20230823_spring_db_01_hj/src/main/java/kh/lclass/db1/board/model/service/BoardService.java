package kh.lclass.db1.board.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.db1.board.model.dao.BoardDao;
import kh.lclass.db1.board.model.vo.BoardVo;

@Service
public class BoardService {
	@Autowired
	private BoardDao boardDao; 
	
	public List<BoardVo> selectList() throws Exception{
		return boardDao.selectList();
	}
	public BoardVo selectOne(int bno) throws Exception{
		return boardDao.selectOne(bno);
	}
	
	@Transactional // 바로 밑에있는 메소드 하나에만 영향을 줌 
	public int insert(BoardVo vo) throws Exception{
		BoardVo returnVo = boardDao.insert(vo);
		int result = returnVo.getBno();
		if(result != 0) {
			System.out.println("-------- insert 실패! --------");
		}
		return result;
	}
	
	public int update(BoardVo vo) throws Exception{
		return boardDao.update(vo);
	}
	public int delete(int bno) throws Exception{
		return boardDao.delete(bno);
	}
}
