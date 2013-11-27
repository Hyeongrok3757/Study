package freeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;

public class FreeBoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
             String fb_num=request.getParameter("fb_num");
             FreeBoardDao dao=new FreeBoardDao();
             dao.freeboarddelete(fb_num);
             ActionForward forward=new ActionForward();
             forward.setPath("freeboardlist.do");
             forward.setRedirect(true);
		
		
		
		return forward;
	}

}
