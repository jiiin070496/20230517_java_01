package talktalk_final.lclass.talk.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.binding.MapperMethod.ParamMap;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import talktalk_final.lclass.talk.board.dto.BoardDto;


@Repository
public class BoardDao {
	@Autowired
	private SqlSession sqlSession; //root-context.xml에 bean SqlSession객체에 적혀있는 아이디
// 게시글 목록
	public List<BoardDto> selectList() throws Exception{ 
		return sqlSession.selectList("board.selectList");
	}
	//페이징
//	public BoardPage selectOne(BoardPage page) throws Exception{
//		page.setTotalList((Integer) sqlSession.selectOne("board.totalList", page));
//		page.setList(sqlSession.selectList("board.totalList", page));
//		return page;
//	}
	
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
	
	public int findLike(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.findLike", map);
	}
	
	public void likeUp(Map<String, Object> map) throws Exception{
		sqlSession.insert("board.likeUp", map);
	}
	
	public void likeDown(Map<String, Object> map) throws Exception{
		sqlSession.delete("board.likeDown", map);
	}
	
	public int getLike(Map<String, Object> map) throws Exception{
		return sqlSession.selectOne("board.getLike", map);
	} 
	
	
	
/* ---------------답글 관련--------------- */	
//// 답글 목록
//	public List<BoardDto> reply_list()throws Exception{
//		return sqlSession.selectList("board.selectReply");
//	}
//	
//// 답글 작성
//	public  BoardDto reply_insert(BoardDto dto) throws Exception{
//		int result =  sqlSession.insert("board.reply_insert", dto);
//		return dto;
//	}
}
