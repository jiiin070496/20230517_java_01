package semi_project.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_project.board.model.service.BoardService;


@WebServlet("/board/delete")
public class BoardDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[-----냄쿵 삭제-----]");
		int bno = Integer.parseInt(request.getParameter("bno"));
		int result = service.delete(bno);
		
//		if(result > 0) {
//			request.getSession().setAttribute("msg", "삭제되었습니다.");
//			response.sendRedirect(request.getContextPath()+"/board/list");
//		}else {
//			request.getSession().setAttribute("msg", "삭제 실패했습니다. 다시 시도해주세요");
//			response.sendRedirect(request.getContextPath()+"/board/read");
//		}
	}
}
