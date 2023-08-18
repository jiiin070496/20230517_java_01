package semi_project.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_project.board.model.dto.BoardDto;
import semi_project.board.model.service.BoardService;


@WebServlet("/board/read")
public class BoardReadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String bnoStr = request.getParameter("bno");
		int bno = 0;
		if(bnoStr != null && !bnoStr.trim().equals("")) {
			try {
				bno = Integer.parseInt(bnoStr);
			}catch(Exception e) {
				request.getSession().setAttribute("successFailMsg", "목록에서 다시 선택해주세요.");
				response.sendRedirect(request.getContextPath()+"/board/list");
				return;
			}
		}
		BoardDto dto = service.selectOne(bno);
		request.setAttribute("bvo", dto);
		request.getRequestDispatcher("/WEB-INF/view/board/read.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
