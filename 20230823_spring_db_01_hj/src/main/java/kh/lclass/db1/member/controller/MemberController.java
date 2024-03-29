package kh.lclass.db1.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import kh.lclass.db1.member.model.sevice.MemberService;

@Controller
public class MemberController {
	@Autowired
	private MemberService memberService;
	
	@GetMapping("/member/list")
	public String list(Model model) {
		//Model ui로 보낼때. 
		//Model 대신 HttpServletRequest request, HttpServletResponse response 를 적으면 getParameter, setAtt가능
		//request.setAttribute("memberList", volist);
		model.addAttribute("memberList", memberService.selectList());
		return "member/list";
	}
}
