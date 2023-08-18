package semi_project.member.model.service;


import java.sql.Connection;
import java.util.List;

import org.apache.ibatis.session.SqlSession;

import semi_project.board.model.dao.BoardDao;
import semi_project.common.jdbc.MyBatisTemplate;
import semi_project.member.model.dao.MemberDao;
import semi_project.member.model.dto.Member;


public class MemberService {
	private BoardDao dao = new BoardDao();
	private MemberDao mdao = new MemberDao();
	
	public List<Member> selectList(){
		List<Member> result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.selectList(session);
		session.close();
		return result;
	}
	public Member selectOne(int bno){
		Member result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.selectOne(session, bno);
		session.close();
		return result;
	}
	public int insert(Member vo){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.insert(session, vo);
		session.close();
		return result;
	}
	public int update(Member dto){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.update(session, dto);
		session.close();
		return result;
	}
	public int delete(int bno){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.delete(session, bno);
		session.close();
		return result;
	}
	
	// 추가
	// login 
	public int login(Member vo) {
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.login(session, vo);
		session.close();
		return result;
	}
	
	// login 
	public String login(String mid) {
		String result = null;
		SqlSession session = MyBatisTemplate.getSqlSession(true);
		result = dao.login(session, mid);
		session.close();
		return result;
	}
}
