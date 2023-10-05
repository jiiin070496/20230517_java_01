package talktalk_final.lclass.talk.board.dao;

import java.util.HashMap;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class LikeDao {
	
	@Autowired private SqlSession sqlSession;

	public void insertLike(int bno,String mid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("bno", bno);
		sqlSession.insert("like.insertLike", map);
	}
	
	public void deleteLike(int bno,String mid)throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("bno", bno);
		sqlSession.delete("like.deleteLike", map);
	}
	
	public int likeCheck(int bno,String mid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("bno", bno);
		return sqlSession.selectOne("like.likeCheck", map);
	}
	
	public void updateLikeCheck(int bno,String mid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("bno", bno);
		sqlSession.update("like.updateLikeCheck", map);
		
	}
			
	public void updateLikeCheckCancel(int bno,String mid) throws Exception{
		Map<String,Object> map = new HashMap<String, Object>();
		map.put("mid", mid);
		map.put("bno", bno);
		sqlSession.update("like.updateLikeCheckCancel", map);
	}

}
