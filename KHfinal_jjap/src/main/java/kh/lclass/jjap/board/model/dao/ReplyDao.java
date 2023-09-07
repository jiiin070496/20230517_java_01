package kh.lclass.jjap.board.model.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.jjap.board.model.vo.ReplyVo;

@Repository
public class ReplyDao {
	@Autowired
	private SqlSession sqlSession;
	
	public ReplyVo writeReply(ReplyVo vo) {
		ReplyVo rvo = new ReplyVo();
		rvo.setRno(vo.getBno());
		
		sqlSession.update("reply_up", rvo);
		
		int grp = sqlSession.selectOne("reply_max_no");
		vo.setGrp(grp+1);
		
		int result = sqlSession.insert
		
		return rvo;
	}
}
