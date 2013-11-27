package freeboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class FreeBoardSearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
      
		String search = request.getParameter("search_item");
		String key = request.getParameter("search_value");
		
		FreeBoardDao dao = new FreeBoardDao();
		
		List<FreeBoardDto>list= dao.freeboardsearch(search,key);
		request.setAttribute("freeboardlist", list);
		
		ActionForward forward = new ActionForward();
		forward.setPath("freeboard/freeboardlist.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
