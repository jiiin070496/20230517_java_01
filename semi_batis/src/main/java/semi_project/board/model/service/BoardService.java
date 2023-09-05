package semi_project.board.model.service;

import semi_project.board.model.dao.BoardDao;
import semi_project.board.model.dto.AttachFileDto;
import semi_project.board.model.dto.BoardDto;
import semi_project.common.jdbc.MyBatisTemplate;
import semi_project.member.model.dao.MemberDao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

public class BoardService {
	private BoardDao dao = new BoardDao();
	private MemberDao mdao = new MemberDao();
	
	public List<BoardDto> selectList(){
		List<BoardDto> result = null;
		SqlSession session = MyBatisTemplate.getSqlSession();
		result = dao.selectList(session);
		session.close();
		return result;
	}
	// 한 행 읽기 - PK로where조건
	public BoardDto selectOne(int bno){
		BoardDto result = null;
		SqlSession session = MyBatisTemplate.getSqlSession();
		result = dao.selectOne(session, bno);
		if(result != null) {
			// 첨부파일들 읽어서 result에 넣기
			List<AttachFileDto> fileList = dao.selectAttachList(session, bno);
			result.setAttachFileList(fileList);
		}
		session.close();
		return result;
	}
	// 한 행 삽입 - BoardDto 자료형을 받아와야 함.
	public int insert(BoardDto dto, List<AttachFileDto> fileList){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession();
		if(dto.getBno() == 0) { // 원본글작성
//			result = dao.insert(session, dto, nextVal);
			if(fileList!=null && fileList.size()>0) {
//				result = dao.insertAttachFileList(conn, fileList, nextval);
			}
		}else {   // 답글작성
//				result = dao.update(conn, dto);
			if(result > -1) {
//				result = dao.insertReply(conn, dto, nextval);
			}
			if(fileList!=null && fileList.size()>0) {
//				result = dao.insertAttachFileList(conn, fileList, nextval);
			}
		}
		if(result > 0) {
			session.commit();
		} else {
			session.rollback();
		}
		session.close();
		return result;
	}
	
	// 한 행 수정 - BoardDto 또는 경우에 따라서 특정 컬럼값만 받아오기도 함.
	public int update(BoardDto dto){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession();
		result = dao.update(session, dto);
		session.close();
		return result;
	}
	
	public int updateContent(BoardDto dto) {
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession();
		result = dao.updateContent(session, dto);
		session.close();
		return result;
	}
	
	// 한 행 삭제 - 주로 PK로 where조건
	public int delete(int bno){
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSession();
		result = dao.delete(session, bno);
		session.close();
		return result;
	}

	public List<BoardDto> selectList2(){
		List<BoardDto> result = null;
		SqlSession session = MyBatisTemplate.getSqlSessionSemi();
		result = dao.selectList2(session);
		session.close();
		return result;
	}
	
	public BoardDto selectOne2(int bno) {
		BoardDto result = null;
		SqlSession session = MyBatisTemplate.getSqlSessionSemi();
		result = dao.selectOne(session, bno);
		session.close();
		return result;
	}
	
	public int insert2(BoardDto dto, int nextVal) {
		int result = 0;
		SqlSession session = MyBatisTemplate.getSqlSessionSemi();
		result = dao.insert2(session, dto, nextVal);
		session.close();
		return result;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
