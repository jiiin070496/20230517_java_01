package talktalk_final.lclass.talk.board.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import talktalk_final.lclass.talk.board.dto.CommentDto;

@Repository
public class CommentDao {
	@Autowired
	private SqlSession sqlsession;
	
	public List<CommentDto> selectList() throws Exception{
		return sqlsession.selectList("comment.selectList");
		
	}
	
}
