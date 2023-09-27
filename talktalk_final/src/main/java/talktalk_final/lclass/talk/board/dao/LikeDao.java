package talktalk_final.lclass.talk.board.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import talktalk_final.lclass.talk.board.dto.LikeDto;

@Repository
public class LikeDao {
	@Autowired
	private SqlSession sqlSession;
	
	public int likeCount(LikeDto dto) throws Exception{
		return sqlSession.selectOne("like.likeCount", dto);
	}
	public int likeGet(LikeDto dto) throws Exception{
		return sqlSession.selectOne("like.likeGet", dto);
	}
	public void likeInsert(LikeDto dto) throws Exception{
		sqlSession.insert("like.likeInsert", dto);
	}
	public void likeUpdate(LikeDto dto) throws Exception{
		sqlSession.update("like.likeUpdate", dto);
	}
}
//public void cancelLike(LikeDto dto) throws Exception{
//	sqlSession.insert("like.cancelLike", dto);
//}
//public void addLike(LikeDto dto) throws Exception{
//	sqlSession.insert("like.addLike", dto);
//}
