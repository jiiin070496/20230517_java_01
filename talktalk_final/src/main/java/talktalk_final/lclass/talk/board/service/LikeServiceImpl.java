package talktalk_final.lclass.talk.board.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import talktalk_final.lclass.talk.board.dao.LikeDao;
import talktalk_final.lclass.talk.board.dto.LikeDto;

@Service
public class LikeServiceImpl implements LikeService{

	@Autowired
	private LikeDao likeDao;
	
	@Override
	public int likeCount(LikeDto dto) throws Exception {
		return likeDao.likeCount(dto);
	}

	@Override
	public int likeGet(LikeDto dto) throws Exception {
		return likeDao.likeGet(dto);
	}

	@Override
	public void likeInsert(LikeDto dto) throws Exception {
		likeDao.likeInsert(dto);
	}

	@Override
	public void likeUpdate(LikeDto dto) throws Exception {
		likeDao.likeUpdate(dto);
	}

//	@Override
//	public void cancelLike(LikeDto dto) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}
//
//	@Override
//	public void addLike(LikeDto dto) throws Exception {
//		// TODO Auto-generated method stub
//		
//	}

}
