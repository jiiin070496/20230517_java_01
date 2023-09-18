package talktalk_final.lclass.talk.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/board")
public class CommentController {
	
	@GetMapping("/clist")
	public String commentList() {
		return "/board/commentList";
	}
}
