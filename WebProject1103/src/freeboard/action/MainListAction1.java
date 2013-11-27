package freeboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class MainListAction1 implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		// 자유게시판 목록
		FreeBoardDao fb_dao = new FreeBoardDao();
		List<FreeBoardDto> freeboardlist = fb_dao.getAllList();
		request.setAttribute("freeboardlist", freeboardlist);
		
		// 공지사항 목록
		NoticeBoardDao nb_dao = new NoticeBoardDao();
		List<NoticeBoardDto> noticeboardlist = nb_dao.noticegetAllList();
		request.setAttribute("noticeboardlist", noticeboardlist);
		
		ActionForward forward = new ActionForward();
		forward.setPath("new_main.jsp");
		forward.setRedirect(false);
		return forward;
		
	}

}
