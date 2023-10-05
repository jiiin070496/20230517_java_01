package talktalk_final.lclass.talk.board.service;

public interface LikeService {
	
	public void insertLike(int bno,String mid) throws Exception;
	public void deleteLike(int bno,String mid)throws Exception;
	public int likeCheck(int bno,String mid) throws Exception;
	public void updateLikeCheck(int bno, String mid)throws Exception;
	public void updateLikeCheckCancel(int bno, String mid)throws Exception;

}
