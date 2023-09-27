package talktalk_final.lclass.talk.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.LikeDto;
import talktalk_final.lclass.talk.board.service.BoardService;
import talktalk_final.lclass.talk.board.service.LikeService;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;	
	@Autowired private LikeService likeService;
//	@Autowired private BoardPage page; 
// --LIST--
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv) throws Exception{
//		page.setCurPage(curPage);
//		mv.addObject("page", boardService.selectOne(page));
		LikeDto dto = new LikeDto();
		mv.addObject("likeCount", likeService.likeCount(dto));
	    mv.addObject("boardList", boardService.selectList());
		mv.setViewName("board/list");
		return mv;
	}
// --GET--	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, @RequestParam("bno") int bno, String mid) { //jsp에서 controller로 데이터 전달
		LikeDto dto = new LikeDto();
		dto.setBno(bno);
		dto.setMid("jiin0960"); // DB에 저장되어있는 아이디.
		
		int like_no = 0;
		int check;
		try {
			check = likeService.likeCount(dto);
			mv.addObject("bvo", boardService.selectOne(bno));
			if(check == 0) {
				likeService.likeInsert(dto);
			}else if(check == 1) {
				like_no = likeService.likeGet(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		mv.addObject("like_no", like_no);
		mv.setViewName("board/get"); // http://localhost:8090/jjap/board/get?bno=3
		return mv;
	}

	
// --DELETE--	
	@PostMapping("/delete")
	@ResponseBody
	public Integer delete(int bno) {
		Integer result = 0;
		try {
			result = boardService.delete(bno);
		} catch (Exception e) {
			e.printStackTrace();
			result = -1;
		}
		return result;
	}	
// --INSERT--
	@GetMapping("/insert")
	public String insert() {
		return "board/insert";
	}
	@PostMapping("/insert")
	@ResponseBody
	public Integer insertDo(BoardDto dto) {
		dto.setMid("jiin0960");
	    Integer result;
	    try {
	        result = boardService.insert(dto);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    	result = -1;
	    }
	    return result;
	}
// --UPDATE--
	@GetMapping("/update")
	public String update(Model model, int bno) throws Exception{
		BoardDto dto = boardService.selectOne(bno); // n번글 정보를 가져옴
        model.addAttribute("dto", dto);
	    return "board/update";
	}
	@PostMapping("/update")
	@ResponseBody
	public Integer updateDo(BoardDto dto){
		Integer result;
	    try {
	        result = boardService.update(dto);
	    } catch (Exception e) {
	        e.printStackTrace();
	        result = -1;
	    }
	    return result;
	}
	
// -- SELECT REPLY --	
//	@GetMapping("/rlist")
//	public ModelAndView rlist(ModelAndView mv) throws Exception{
//		mv.addObject("rList", boardService.reply_list());
//		mv.setViewName("board/get");
//		return mv;
//	}
	
// --REPLY INSERT--
//	@GetMapping("/rinsert")
//	public String reply_insert(Model model, Integer bno) throws Exception{
//		BoardDto dto = boardService.selectOne(bno);
//	    model.addAttribute("dto", dto);
//	    return "board/rlist";
//	}
//	@PostMapping("/rinsertDo")
//	@ResponseBody
//	public Integer reply_insertDo(BoardDto dto) {
//		dto.setMid("jiin0960");
//	    Integer result;
//	    try {
//	        result = boardService.reply_insert(dto);
//	    } catch (Exception e) {
//	    	e.printStackTrace();
//	    	result = -1;
//	    }
//	    return result;
//	}
//	
	
}