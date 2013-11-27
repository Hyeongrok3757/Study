package freeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class FreeBoardDetailAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		   String fb_num=request.getParameter("fb_num");
		   FreeBoardDao dao=new FreeBoardDao();
		   FreeBoardDto dto=dao.freeboardDetail(fb_num);
	       request.setAttribute("dto", dto);
	       dao.freereadCount(fb_num);
	       
	       ActionForward forward=new ActionForward();
		   forward.setPath("freeboard/freeboarddetail.jsp");
		   forward.setRedirect(false);
	       
	       
		return forward;
	}

}
