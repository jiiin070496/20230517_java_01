package talktalk_final.lclass.talk.board.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.service.BoardService;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;

// --LIST--
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv) throws Exception{
		mv.addObject("boardList", boardService.selectList());
		mv.setViewName("board/list");
		return mv;
	}

// --GET--	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, int bno) throws Exception{ //jsp에서 controller로 데이터 전달
		mv.addObject("bvo", boardService.selectOne(bno));
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
	    Integer result = 0;
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
		BoardDto dto = boardService.selectOne(bno); // 글 정보를 가져옴
        model.addAttribute("dto", dto);
	    return "board/update";
	}
	@PostMapping("/update")
	public String updateDo(RedirectAttributes redirectAttr, BoardDto dto){
		String viewPage = "redirect:/";
		int result;
	    try {
	        result = boardService.update(dto);
	        if (result < 1) {
	            redirectAttr.addFlashAttribute("msg2", "글 수정에 실패했습니다. 다시 시도해주세요.");
	            viewPage = "redirect:/board/get?bno="+dto.getBno();
	        } else {
	            redirectAttr.addFlashAttribute("msg2", "글 수정되었습니다.");
	            viewPage = "redirect:/board/get?bno="+dto.getBno();
	        }
	    } catch (Exception e) {
	        redirectAttr.addFlashAttribute("msg2", "예기치 못한 오류로 글 수정에 실패했습니다.");
	        e.printStackTrace();
	        viewPage = "redirect:/board/list";
	    }
	    return viewPage;
	}	
}