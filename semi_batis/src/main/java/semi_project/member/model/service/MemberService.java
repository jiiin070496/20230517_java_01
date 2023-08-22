package semi_project.member.model.service;


import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi_project.board.model.dao.BoardDao;
import semi_project.common.jdbc.MyBatisTemplate;
import semi_project.member.model.dao.MemberDao;
import semi_project.member.model.dto.Member;


public class MemberService {
	private MemberDao dao = new MemberDao();
	
	//회원가입
	public int insert(Member dto){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.insert(session, dto);
		session.close();
		return result;
	}
	
	// login 
	public int login(Member dto) {
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.login(session, dto);
		session.close();
		return result;
	}
}
