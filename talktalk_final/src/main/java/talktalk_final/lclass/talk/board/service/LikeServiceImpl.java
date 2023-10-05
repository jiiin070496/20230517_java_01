package talktalk_final.lclass.talk.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import talktalk_final.lclass.talk.board.dao.LikeDao;

@Service
public class LikeServiceImpl implements LikeService{
	
	@Autowired private LikeDao likeDao;
	
	@Override
	public void insertLike(int bno, String mid) throws Exception {
		likeDao.insertLike(bno, mid);
		
	}

	@Override
	public void deleteLike(int bno, String mid) throws Exception {
		likeDao.deleteLike(bno, mid);
	}

	@Override
	public int likeCheck(int bno, String mid) throws Exception {
		return likeDao.likeCheck(bno, mid);
	}

	@Override
	public void updateLikeCheck(int bno, String mid) throws Exception {
		likeDao.updateLikeCheck(bno, mid);
	}

	@Override
	public void updateLikeCheckCancel(int bno, String mid) throws Exception {
		likeDao.updateLikeCheckCancel(bno, mid);
	}

}
