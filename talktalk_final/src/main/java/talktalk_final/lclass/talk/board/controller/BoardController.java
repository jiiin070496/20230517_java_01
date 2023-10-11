package talktalk_final.lclass.talk.board.controller;



import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.Criteria;
import talktalk_final.lclass.talk.board.dto.PageMakerDto;
import talktalk_final.lclass.talk.board.service.BoardService;
import talktalk_final.lclass.talk.board.service.LikeService;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;	
	@Autowired private LikeService likeService;	

// --LIST--
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv, Criteria cri) throws Exception{
		int total = boardService.getTotal(cri);
		PageMakerDto pageMake = new PageMakerDto(cri, total);
		mv.addObject("boardList", boardService.getListPage(cri));
		mv.addObject("pageMaker", pageMake);
		mv.addObject("total", total);
		mv.setViewName("board/list");
		return mv;
	}
 //--GET--	
	@GetMapping("/get")
	public ModelAndView get(ModelAndView mv, int bno, Criteria cri) throws Exception{ //jsp에서 controller로 데이터 전달
		mv.addObject("bvo", boardService.selectOne(bno));
		mv.addObject("cri", cri);
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
	public String update(Model model, int bno, Criteria cri) throws Exception{
		BoardDto dto = boardService.selectOne(bno); // n번글 정보를 가져옴
        model.addAttribute("dto", dto);
        model.addAttribute("cri", cri);
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

// --------------- LIKE ---------------	
	@ResponseBody
	@RequestMapping(value = "/updateLike" , method = RequestMethod.POST)
	public int updateLike(Model model, int bno, String mid)throws Exception{
			
			int likeCheck = likeService.likeCheck(bno, mid);
			if(likeCheck == 0) {
				//좋아요 처음누름
				likeService.insertLike(bno, mid); //like테이블 삽입
				boardService.totalLike(bno);
				likeService.updateLikeCheck(bno, mid);//like테이블 구분자 1
			}else if(likeCheck == 1) {
				likeService.updateLikeCheckCancel(bno, mid); //like테이블 구분자0
				boardService.totalLikeCancel(bno);
				likeService.deleteLike(bno, mid); //like테이블 삭제
			}
			return likeCheck;
	}

}
