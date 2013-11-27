package noticeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;

public class NoticeBoardDeleteAction implements NoticeAction{

	@Override
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
             String nb_num=request.getParameter("nb_num");
             NoticeBoardDao dao=new NoticeBoardDao();
             dao.noticeboarddelete(nb_num);
             NoticeActionForward forward=new NoticeActionForward();
             forward.setPath("noticeboardlist.do");
             forward.setRedirect(true);
		
		
		
		return forward;
	}

}
