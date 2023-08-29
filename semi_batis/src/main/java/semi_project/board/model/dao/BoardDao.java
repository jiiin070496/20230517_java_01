package semi_project.board.model.dao;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import semi_project.board.model.dto.AttachFileDto;
import semi_project.board.model.dto.BoardDto;



public class BoardDao {
	
	public List<AttachFileDto> selectAttachList(SqlSession session, int bno){
		System.out.println("[Board Dao selectAttachFile]");
		List<AttachFileDto> result = session.selectList("boardMapper1.selectAttachFile1", bno);
		System.out.println("[Board Dao selectAttachFile] return: " + result);
		return result;
	}
	
	public List<BoardDto> selectList(SqlSession session) {
		System.out.println("[Board Dao selectList]");
		List<BoardDto> result = session.selectList("boardMapper1.selectList1");
		System.out.println("[Board Dao selectList] return:" + result);
		return result;
	}

	public BoardDto selectOne(SqlSession session, int bno) {
		//mybatis
		System.out.println("[Board Dao selectOne]");
		BoardDto result = session.selectOne("boardMapper1.selectOne1", bno);
		System.out.println("[Board Dao selectOne] return: " + result);
		return result;
	}

	public int insert(SqlSession session, BoardDto dto, int nextVal) {
		System.out.println("[Board Dao insert]");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("nextVal", nextVal);
		int result = session.insert("boardMapper1.insert1", map);
		System.out.println("[Board Dao insert] return:" + result);
		return result;
	}
	
	//답글
	public int insertReply(SqlSession session, BoardDto dto, int nextVal) {
		System.out.println("[Board Dao insertReply]");
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("nextVal", nextVal);
		int result = session.insert("boardMapper1.insertReply1", map);
		System.out.println("[Board Dao insertReply] return:" + result);
		return result;
	}

	public int update(SqlSession session, BoardDto dto) {
		System.out.println("[Board Dao update] dto:" + dto);
		int result = session.update("boardMapper1.update1", dto);
		System.out.println("[Board Dao update] return:" + result);
		return result;
	}

	public int updateContent(SqlSession session, BoardDto dto) {
		System.out.println("[Board Dao updateContent]");
		int result = session.update("boardMapper1, updateContent1", dto);
		System.out.println("[Board Dao updateContent] return:" + result);
		return result;
	}
	
	public int delete(SqlSession session, int bno) {
		System.out.println("[Board Dao delete] bno:" + bno);
		int result = session.delete("boardMapper1.delete1", bno);		
		System.out.println("[Board Dao delete] return:" + result);
		return result;
	}	
	
	public List<BoardDto> selectList2(SqlSession session){
		List<BoardDto> result = session.selectList("BoardMapper1.selectList1");
		return result;
	}
	
	public BoardDto selectOne2(SqlSession session, int bno) {
		BoardDto result = session.selectOne("BoardMapper1.selectOne1", bno);
		return result;
	}
	
	public int insert2(SqlSession session, BoardDto dto, int nextVal) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dto", dto);
		map.put("nextVal", nextVal);
		int result = session.insert("BoardMapper1.insert1", dto);
		return result;
	}
	
}
