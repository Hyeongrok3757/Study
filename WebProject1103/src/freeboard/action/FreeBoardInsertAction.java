package freeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class FreeBoardInsertAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
	
		request.setCharacterEncoding("euc-kr");
		
		String fb_writer=request.getParameter("fb_writer");
		String fb_subject=request.getParameter("fb_subject");
		String fb_content=request.getParameter("fb_content");
		String fb_pwd=request.getParameter("fb_pwd");
		
		FreeBoardDto dto=new FreeBoardDto();
		dto.setFb_writer(fb_writer);
		dto.setFb_subject(fb_subject);
		dto.setFb_content(fb_content);
		dto.setFb_pwd(fb_pwd);
		
	    FreeBoardDao dao=new FreeBoardDao();
		dao.fboardinsert(dto);
		
		ActionForward forward=new ActionForward();
		 forward.setPath("freeboardlist.do");
		 forward.setRedirect(true);
		return forward;
	}

}
