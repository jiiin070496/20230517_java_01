package talktalk_final.lclass.talk.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import talktalk_final.lclass.talk.board.dto.ReplyDto;

@Repository
public class Replydao {
	@Autowired
	private SqlSession sqlSession;
	
//	public List<ReplyDto> selectList() throws Exception{
//	}
}
