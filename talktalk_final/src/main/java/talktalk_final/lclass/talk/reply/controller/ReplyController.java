package talktalk_final.lclass.talk.reply.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;

import talktalk_final.lclass.talk.reply.dto.ReplyDto;
import talktalk_final.lclass.talk.reply.service.ReplyService;

@Controller
@RequestMapping("/replyboard")
public class ReplyController {
	
	@Autowired private ReplyService replyService;

	@GetMapping("/list")
	@ResponseBody
	public String selectListReply(ModelAndView mv, Integer boardNo) throws Exception{
		List<ReplyDto> result = replyService.selectList(boardNo);
		mv.addObject("replyList", replyService.selectList(boardNo));
		mv.setViewName("board/list");
		return new Gson().toJson(result);
	}
	@GetMapping("/one")
	public ModelAndView selectOneReply(ModelAndView mv, int replyNo) throws Exception{
		mv.addObject("replyboard", replyService.selectOne(replyNo));
		mv.setViewName("replyboard/one");
		return mv;
	}
	
	@PostMapping("/insert")
	@ResponseBody
	public String insertDoReply(ReplyDto rdto) throws Exception{
		List<ReplyDto> result = replyService.insert(rdto);
		return new Gson().toJson(result);
	}
	
	@PostMapping("/replyinsert")
	@ResponseBody
	public String insertrereply(ReplyDto rdto) throws Exception{
		List<ReplyDto> result = replyService.insertreplyreply(rdto);
		return new Gson().toJson(result);
	}

	@PostMapping("/update")
	@ResponseBody
	public String updateDoMemeber(ReplyDto rdto) throws Exception{
		ReplyDto result = replyService.update(rdto);
		return new Gson().toJson(result);
	}
	
	@PostMapping("/delete")
	@ResponseBody
	public String deleteDoMemeber(RedirectAttributes redirectAttr, int replyNo) throws Exception{
		List<ReplyDto> result = replyService.delete(replyNo);
		return new Gson().toJson(result);
	}












}
