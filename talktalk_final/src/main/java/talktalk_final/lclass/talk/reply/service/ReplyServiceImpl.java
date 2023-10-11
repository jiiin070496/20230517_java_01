package talktalk_final.lclass.talk.reply.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import talktalk_final.lclass.talk.reply.dao.ReplyDao;
import talktalk_final.lclass.talk.reply.dto.ReplyDto;


@Service
public class ReplyServiceImpl implements ReplyService {
	@Autowired private ReplyDao replyDao;

	@Override
	public List<ReplyDto> selectList(Integer boardNo) throws Exception {
		return replyDao.selectList(boardNo);
	}

	@Override
	public ReplyDto selectOne(int replyNo) throws Exception {
		return replyDao.selectOne(replyNo);
	}

	@Override
	@Transactional
	public List<ReplyDto> insert(ReplyDto rdto) throws Exception {
		int result = replyDao.insert(rdto);
		List<ReplyDto> replyList = replyDao.selectList(rdto.getBoardNo());
		return replyList;
	}

	@Override
	@Transactional
	public List<ReplyDto> insertreplyreply(ReplyDto rdto) throws Exception {
		int result = replyDao.insertreplyreply(rdto);
		List<ReplyDto> replyList = replyDao.selectList(rdto.getBoardNo());
		return replyList;
	}

	@Override
	@Transactional
	public ReplyDto update(ReplyDto rdto) throws Exception {
		int result = replyDao.update(rdto);
		ReplyDto replyList = replyDao.selectOne(rdto.getBoardNo());
		return replyList;
	}

	@Override
	@Transactional
	public List<ReplyDto> delete(int replyNo) throws Exception {
		ReplyDto rdto = replyDao.selectOne(replyNo);
		int replyDtoNo = rdto.getBoardNo();
		int result = replyDao.delete(replyNo);
		List<ReplyDto> replyList = replyDao.selectList(replyDtoNo);
		return replyList;
	}

	@Override
	public List<ReplyDto> selectMoreList(int rref) {
		return replyDao.selectMoreList(rref);
	}

	
}
