package talktalk_final.lclass.talk.board.controller;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import talktalk_final.lclass.talk.board.dto.BoardDto;
import talktalk_final.lclass.talk.board.dto.LikeDto;
import talktalk_final.lclass.talk.board.service.BoardService;

import org.springframework.ui.Model;

@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired private BoardService boardService;	
//	@Autowired private BoardPage page; 
// --LIST--
	@GetMapping("/list")
	public ModelAndView list(ModelAndView mv) throws Exception{
//		page.setCurPage(curPage);
//		mv.addObject("page", boardService.selectOne(page));
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
	
	@GetMapping("/readcnt")
	@ResponseBody
	public Integer updatecnt(ModelAndView mv, int bno ) throws Exception{
		return boardService.boardReadCnt(bno);
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
	
// 게시글 좋아요 및 취소
	@PostMapping("/doLike")
	@ResponseBody
	public HashMap<String, Object> doLike(@RequestBody LikeDto lDto) throws Exception{
	    HashMap<String, Object> data = new HashMap<>();
	    int myLikeCount = 0;
	    try {
	        myLikeCount = boardService.getMyLikeCount(lDto);
	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    if(myLikeCount > 0) {
	        // 이미 좋아요를 눌렀으므로 좋아요를 취소합니다.
	        boardService.deleteLike(lDto);
	        data.put("status", "unlike");
	    } else {
	        // 좋아요를 누르지 않았으므로 좋아요를 추가합니다.
	        boardService.doLike(lDto);
	        data.put("status", "like");
	    }
	    
	    // 좋아요 수 업데이트
	    int totalLikeCount = boardService.getTotalLikeCount(lDto.getBno());
	    data.put("totalLikeCount", totalLikeCount);
	    
	    data.put("result", "success");
	    return data;
	}
	
// 게시글 좋아요 상태
	@PostMapping("/getMyLikeStatus")
	public HashMap<String, Object> getMyLikeStatus(LikeDto lDto) throws Exception{
		HashMap<String, Object> data = new HashMap<>();
		lDto.setMid("jiin0960");

		int myLikeCount = boardService.getMyLikeCount(lDto);

		data.put("result", "success");
		
		if(myLikeCount > 0) {
			data.put("status", "like");
		}else {
			data.put("status", "unlike");
		}
		return data;
	}

// 게시글 좋아요 총 갯수
	@PostMapping("/getTotalLikeCount")
	public HashMap<String, Object> getTotalLikeCount(int bno) throws Exception{
		HashMap<String, Object> data = new HashMap<>();
		int totalLikeCount = boardService.getTotalLikeCount(bno);
		data.put("totalLikeCount", totalLikeCount);
		return data;
	}
}


//function submitreplyreplyHandler() {
//    console.log("submitreplyreplyHandler");
//    var replyreplyContent = $("[name=replyreplyContent]").val();
//    console.log(replyreplyContent);
//    $.ajax({
//        type: "post",
//        url: "${pageContext.request.contextPath}/replyboard/replyinsert",
//        data: {memberId:"${bvo.mid}",  replyContent : replyreplyContent, boardNo:${bvo.bno},rref : $(this).parents(".replyCard").data("replyno") },
//        success: function (result) {
//            console.log("success");
//        },
//        error : function () {
//            console.log("error");
//        },
//        dataType: "json"
//    });
//}








