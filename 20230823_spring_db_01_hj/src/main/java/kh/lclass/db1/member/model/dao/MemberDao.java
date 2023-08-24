package kh.lclass.db1.member.model.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kh.lclass.db1.member.model.vo.MemberVo;

@Repository("memberDao")
public class MemberDao {
	
	//AutoWired 사용시 Spring에서 이미 만들어진 bean객체를 가져다 씀.
	//따라서 = NULL 또는 = new Xxx()대입하면 안됌.
	@Autowired
	private SqlSession sqlSession; //root-context.xml에 bean SqlSession객체에 적혀있는 아이디
	
	public List<MemberVo> selectList(){
		return sqlSession.selectList("member.selectList");
	}
	public MemberVo selectOne(String pk){
		return sqlSession.selectOne("member.selectOne", pk);
	}
	
	public int insert(MemberVo vo) {
		return sqlSession.insert("member.insert", vo);
	}
	public int update(MemberVo vo) {
		return sqlSession.update("member.update", vo);
	}
	public int delete(String pk) {
		return sqlSession.delete("member.delete", pk);
	}
}
