package kh.lclass.db1.member.model.sevice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kh.lclass.db1.member.model.dao.MemberDao;
import kh.lclass.db1.member.model.vo.MemberVo;

@Service
public class MemberService {
	
	@Autowired
	private MemberDao memberDao; 
	
	public List<MemberVo> selectList(){
		return memberDao.selectList();
	}

	public MemberVo selectOne(String pk){
		return memberDao.selectOne(pk);
	}
	
	public int insert(MemberVo vo) {
		return memberDao.insert(vo);
	}
	
	@Transactional // 바로 밑에있는 메소드 하나에만 영향을 줌 
	public int insertReply(MemberVo vo) {
		memberDao.update(vo);
		return memberDao.insert(vo);
	}
	
	public int update(MemberVo vo) {
		return memberDao.update(vo);
	}
	public int delete(String pk) {
		return memberDao.delete(pk);
	}
}
