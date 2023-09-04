package kh.lclass.db1.board.controller;


import java.security.Principal;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kh.lclass.db1.board.model.service.BoardService;
import kh.lclass.db1.board.model.vo.BoardVo;
import kh.lclass.db1.common.FileUpload;


@Controller
@RequestMapping("/board")
public class BoardController {
	@Autowired
	private BoardService boardService;
	@Autowired
	private FileUpload fileUpload;
	
	//@RequestMapping(value = "/board", method = RequestMethod.GET)의 줄임
	@GetMapping("/list")
	public ModelAndView list(
			//Model model - Controller --> jsp(view)선택 + 데이터 전달
//			RedirectAttributes rttr 
			String msg2,
			String m3,
			String n1,
			ModelAndView mv
			) throws Exception{
//		model.addAttribute("boardList", boardService.selectList());
//		return "board/list";
		// 안보임. 의미 없음. jsp에서 데이터 꺼내짐
//		System.out.println(rttr.getAttribute("msg2"));
//		Map<String, Object> map = (Map<String, Object>)rttr.getFlashAttributes();
//		System.out.println(map);
		
		mv.addObject("boardList", boardService.selectList());
		mv.setViewName("board/list");
		return mv;
	}
	@GetMapping("/get/{bno}") //{bno} - 지은이름
	public String get(Model model
			//, int bno
			, @PathVariable("v\bno") int bno
			) throws Exception{ //jsp에서 controller로 데이터 전달
		// Controller --> jsp(view)에 데이터 전달
		model.addAttribute("boardVo", boardService.selectOne(bno));
		//Controller --> jsp(view) 선택 (forward)
		return "board/get";
	}
	@GetMapping("/insert")
	public String insert() {
		//FlashAttribute를 위해 여기에 작성할것이 없음
//		return "board/insert"; 이렇게해도 되지만 코드의 일관성을 위해
		String viewPage = "board/insert";
		return viewPage; // 이렇게 작성
	}
	@PostMapping("/insert")
	public String insertDo(
			RedirectAttributes redirectAttr // redirect:/url 상황에서 url--> jsp 데이터를 전달하기 위해 추가된 자료형 
			, BoardVo vo
			, String btitle
			, Principal principal
			//, MultipartRequest multiReq // 파일첨부 - 첨부할 파일이 여러개일때
			, MultipartFile multiFile // 파일첨부 - 첨부할 파일이 한개일때
			, @RequestParam(name = "hobby") String[] hobbyArr
			, @RequestParam(name = "uploadFile1") MultipartFile file1 // 저장하는 코드는 common/FileUpload
			, @RequestParam(name = "uploadFile2") MultipartFile file2
			, @RequestParam(name = "uploadFile") MultipartFile[] files
			, HttpServletRequest request
			) { //ExceptHandler로 가지않고 메소드 내부에서 처리함.
		String viewPage = "redirect:/";
		Map<String, String> filename = fileUpload.saveFile(file1, file2);

		//login한 mid
		//String mid = principal.getName();
		vo.setMid("jiin0960");
		
		int result; //1: 글 등록 성공, 0: 글 등록 실패
		try {
			result = boardService.insert(vo);
			if(result < 1) {
				redirectAttr.addAttribute("msg2", "msg2"); //url에 뿌려짐 ?msg2=msg2&n1=n1
				redirectAttr.addFlashAttribute("msg", "글 등록에 실패했습니다. 다시 입력해세요."); // 1회성으로 뿌려짐
				viewPage = "redirect:/board/insert";
			}else {
				redirectAttr.addAttribute("msg2", "msg2");
				redirectAttr.addAttribute("msg3", "msg3");
				redirectAttr.addFlashAttribute("msg", "글 등록되었습니다.");
				viewPage = "redirect:/board/list?n1=v1&n2=v2";
			}
		}catch(Exception e) {
			//오류 발생시
			redirectAttr.addAttribute("msg2", "msg2");
			redirectAttr.addFlashAttribute("msg", "예기치 못한 오류로 글등록에 실패했습니다. 다시 시도해주세요.");
			viewPage = "redirect:/board/list";
		}
		return "viewPage";
	}
//	@ExceptionHandler
//	public void e() {}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
