package semi_project.member.model.service;

import static semi_project.common.jdbc.jdbcTemplate.*;

import java.sql.Connection;
import java.util.List;

import semi_project.member.model.dao.MemberDao;
import semi_project.member.model.dto.Member;


public class MemberService {
	private MemberDao dao = new MemberDao();
	
	public List<Member> selectList(){
		List<Member> result = null;
		Connection conn = getConnectionSemi();
		result = dao.selectList(conn);
		close(conn);
		return result;
	}
	public Member selectOne(int bno){
		Member result = null;
		Connection conn = getConnectionSemi();
		result = dao.selectOne(conn, bno);
		close(conn);
		return result;
	}
	public int insert(Member vo){
		int result = 0;
		Connection conn = getConnectionSemi();
		result = dao.insert(conn, vo);
		close(conn);
		return result;
	}
	public int update(Member dto){
		int result = 0;
		Connection conn = getConnectionSemi();
		result = dao.update(conn, dto);
		close(conn);
		return result;
	}
	public int delete(int bno){
		int result = 0;
		Connection conn = getConnectionSemi();
		result = dao.delete(conn, bno);
		close(conn);
		return result;
	}
	
	// 추가
	// login 
	public int login(Member vo) {
		int result = 0;
		Connection conn = getConnectionSemi();
		result = dao.login(conn, vo);
		close(conn);
		return result;
	}
	
	// login 
	public String login(String mid) {
		String result = null;
		Connection conn = getConnectionSemi();
		result = dao.login(conn, mid);
		close(conn);
		return result;
	}
}
