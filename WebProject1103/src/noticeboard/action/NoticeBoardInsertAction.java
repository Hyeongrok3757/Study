package noticeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

public class NoticeBoardInsertAction implements NoticeAction {

	@Override
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		
		String nb_writer=request.getParameter("nb_writer");
		String nb_subject=request.getParameter("nb_subject");
		String nb_content=request.getParameter("nb_content");
		String nb_pwd=request.getParameter("nb_pwd");
		
		NoticeBoardDto dto=new NoticeBoardDto();
		dto.setNb_writer(nb_writer);
		dto.setNb_subject(nb_subject);
		dto.setNb_content(nb_content);
		dto.setNb_pwd(nb_pwd);
		
		NoticeBoardDao dao=new NoticeBoardDao();
		dao.noticeboardinsert(dto);
		
		NoticeActionForward forward=new NoticeActionForward();
		 forward.setPath("noticeboardlist.do");
		 forward.setRedirect(true);
		return forward;
	}

}
