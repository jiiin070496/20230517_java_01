package semi_project.member.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;

import semi_project.board.model.dto.AttachFileDto;
import semi_project.member.model.dto.Member;

public class MemberDao {

	public int insert(SqlSession session, Member dto) {
		System.out.println("[Member Dao insert]");
		int result = session.insert("memberMapper1, insert1", dto);
		System.out.println("[Member Dao insert] return:" + result);
		return result;
	}

	// login : 성공 :1, 실패시:0  --> 암호화 적용 힘든 방식
	public int login(SqlSession session, Member dto) {
		int result =session.select
		return result;
		
	}
	
}
