package semi_project.board.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_project.board.model.dto.BoardDto;
import semi_project.board.model.service.BoardService;


@WebServlet("/board/list")
public class BoardListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("[-----냄궁 세션 attribute-----]");
		System.out.println(request.getSession().getAttribute("SsLoginId"));
		System.out.println(request.getAttribute("SsLoginId"));
		String msg = (String)request.getSession().getAttribute("successFailMsg");
		if(msg != null && !msg.equals("")) {
			request.setAttribute("successFailMsg", msg);
			request.getSession().removeAttribute("successFailMsg");
		}
		List<BoardDto> result = new BoardService().selectList();
		request.setAttribute("boardList", result);
		request.getRequestDispatcher("/WEB-INF/view/board/list.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
