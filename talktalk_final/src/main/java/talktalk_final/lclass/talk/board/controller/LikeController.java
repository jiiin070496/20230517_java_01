package talktalk_final.lclass.talk.board.controller;

import java.lang.System.Logger;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.logging.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;

import talktalk_final.lclass.talk.board.dto.LikeDto;
import talktalk_final.lclass.talk.board.service.LikeService;

@Controller
@RequestMapping("/like")
public class LikeController {

	@Autowired LikeService likeService;
	
	@PostMapping("/likeUpdate")
	public Map<String,String> likeupdate(@RequestBody LikeDto dto){
		Map<String,String> map = new HashMap<String, String>();
		try {
			likeService.likeUpdate(dto);
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "fail");
		}
		return map;
	}
}
