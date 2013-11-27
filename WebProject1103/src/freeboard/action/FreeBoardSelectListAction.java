package freeboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class FreeBoardSelectListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("count"));
		
		FreeBoardDao dao = new FreeBoardDao();
		List<FreeBoardDto> list = dao.freeboardSelectList(num);
		request.setAttribute("freeboardlist", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("freeboard/freeboardlist.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
