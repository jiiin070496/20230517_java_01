package talktalk_final.lclass.talk.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.LikeDto;


@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession; //root-context.xml에 bean SqlSession객체에 적혀있는 아이디
// 게시글 목록
	public List<BoardDto> selectList() throws Exception{ 
		return sqlSession.selectList("board.selectList");
	}
	
// 게시글 상세	
	public BoardDto selectOne(int bno) throws Exception{
		return sqlSession.selectOne("board.selectOne", bno);
	}
	
// 글 등록	
	// insert 시 selectKey를 이용해 PK 값이 추가되어있는 자료형
	public BoardDto insert(BoardDto dto) throws Exception{
		int result = sqlSession.insert("board.insert", dto);
		return dto;
	}
	
// 글 수정	
	public int update(BoardDto dto) throws Exception{
		return sqlSession.update("board.update", dto);
	}

// 글 삭제	
	public int delete(int bno) throws Exception{
		return sqlSession.delete("board.delete", bno);
	}
// 게시판 조회수
	public int boardReadCnt(int bno) throws Exception{
		return sqlSession.update("board.boardReadCnt", bno);
	}
	
// 좋아요
	public void doLike(LikeDto lDto) throws Exception{
		sqlSession.insert("board.doLike", lDto);
	}
	
// 좋아요 상태
	public int getMyLikeCount(LikeDto lDto) throws Exception{
		return sqlSession.selectOne("board.getMyLikeCount", lDto);
	}
	
// 좋아요 취소
	public void deleteLike(LikeDto lDto) throws Exception{
		sqlSession.delete("board.deleteLike", lDto);
	}
	
// 좋아요 갯수
	public int getTotalLikeCount(int bno) throws Exception{
		return sqlSession.selectOne("board.getTotalLikeCount", bno);
	}
}














