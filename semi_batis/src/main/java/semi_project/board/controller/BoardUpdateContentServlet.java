package semi_project.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import semi_project.board.model.dao.BoardDao;
import semi_project.board.model.dto.BoardDto;
import semi_project.board.model.service.BoardService;


@WebServlet("/board/update")
public class BoardUpdateContentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private BoardService service = new BoardService();
	
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	int bno = Integer.parseInt(request.getParameter("bno"));
    	BoardDto dto = service.selectOne(bno); // 게시글 정보를 읽어옴
        request.setAttribute("dto", dto);
        request.getRequestDispatcher("/WEB-INF/view/board/update.jsp").forward(request, response);
	    }
   
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("-----UpdateContent doPost-----");
      		int bno = Integer.parseInt(request.getParameter("bno"));
	        String btitle = request.getParameter("btitle");
	        String bcontent = request.getParameter("bcontent");
	        
	        BoardDto dto = new BoardDto();
			
			dto.setBno(bno);
			dto.setBtitle(btitle);
			dto.setBcontent(bcontent);
			
			int result = service.updateContent(dto);
			
			if (result == 1) {
			    response.sendRedirect(request.getContextPath() + "/board/update?bno=" + bno);
			    request.setAttribute("msg", "글 수정이 완료되었습니다.");
			} else {
			    response.sendRedirect(request.getContextPath() + "/board/read?bno=" + bno);
			    request.setAttribute("msg", "글 수정에 실패하였습니다.");
			}
			request.setAttribute("dto", dto);
		}

}
