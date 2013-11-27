package noticeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

public class NoticeBoardUpdateFormAction implements NoticeAction{

	@Override                   
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		   String nb_num=request.getParameter("nb_num");
		   NoticeBoardDao dao=new NoticeBoardDao();//�������� ���ϰ�--->�������� ���ϰ� 
		   NoticeBoardDto dto=dao.noticeboardDetail(nb_num);
		   request.setAttribute("dto", dto);
		   
		   NoticeActionForward forward=new NoticeActionForward();
		   forward.setPath("noticeboard/noticeboardupdateform.jsp");
		   forward.setRedirect(false);
		
		
		return forward;
	}

}
