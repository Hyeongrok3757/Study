package noticeboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;


public class NoticeBoardSelectListAction implements NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		int num = Integer.parseInt(request.getParameter("count"));
		
		NoticeBoardDao dao = new NoticeBoardDao();
		List<NoticeBoardDto> list = dao.noticeboardSelectList(num);
		request.setAttribute("noticeboardlist", list);
		
		NoticeActionForward forward = new NoticeActionForward();
		forward.setPath("noticeboard/noticeboardlist.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
