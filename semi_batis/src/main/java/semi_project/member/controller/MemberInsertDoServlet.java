package semi_project.member.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_project.member.model.dto.Member;
import semi_project.member.model.service.MemberService;

@WebServlet("/member/insert.do")
public class MemberInsertDoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private MemberService service = new MemberService();
	
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    	if(request.getSession().getAttribute("mid") == null) {
//    		request.getRequestDispatcher("/WEB-INF/board/list").forward(request, response);
//    	}else {
//    		response.sendRedirect(request.getContextPath()+"/list");
//    	}
//    }
	
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[-----냄쿵 MemberInsert doGet!!-----]");
		String mid = request.getParameter("mid");
		String mpwd = request.getParameter("mpwd");
		String mname = request.getParameter("mname");
		String memail = request.getParameter("memail");
		String mphoneno = request.getParameter("mphoneno");
		Member vo = new Member(mid, mpwd, mname, memail, mphoneno);
		System.out.println("[insert servlet] "+vo);
		
		int result = service.insert(vo);
		if (result == 0) {
		    request.getSession().setAttribute("sfMsg", "회원가입에 실패했습니다.");
		    response.sendRedirect(request.getContextPath() + "/member/login");
		} else {
		    request.getSession().setAttribute("sfMsg", mname + "님 회원가입 완료되었습니다.");
		    response.sendRedirect(request.getContextPath() + "/board/list");
		}
	}
	
}
