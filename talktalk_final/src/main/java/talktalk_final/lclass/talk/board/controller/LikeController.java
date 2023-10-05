package talktalk_final.lclass.talk.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import talktalk_final.lclass.talk.board.service.LikeService;

@Controller
public class LikeController {
	@Autowired private LikeService likeService;
}
