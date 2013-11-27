package noticeboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

public class NoticeBoardSearchAction implements NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
      
		request.setCharacterEncoding("euc-kr");
		
		String search = request.getParameter("search_item");
		String key = request.getParameter("search_value");
		NoticeBoardDao dao = new NoticeBoardDao();
		
		List<NoticeBoardDto>list= dao.noticeboardsearch(search,key);
		request.setAttribute("noticeboardlist", list);
		
		NoticeActionForward forward = new NoticeActionForward();
		forward.setPath("noticeboard/noticeboardlist.jsp");
		forward.setRedirect(false);

		return forward;
	}

}
