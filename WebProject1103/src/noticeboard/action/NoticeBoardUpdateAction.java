package noticeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import noticeboard.dao.NoticeBoardDao;
import noticeboard.dto.NoticeBoardDto;

public class NoticeBoardUpdateAction implements NoticeAction{

	@Override                    //Model(dto)�� �����ϴ� ���(��)
	public NoticeActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		 String nb_num=request.getParameter("nb_num");
		 String nb_subject=request.getParameter("nb_subject");
		 String nb_content=request.getParameter("nb_content");
		 
		 NoticeBoardDto dto=new NoticeBoardDto();//DI(����������)������� ���� 
		 
		 dto.setNb_num(Integer.parseInt(nb_num));
		 dto.setNb_subject(nb_subject);
		 dto.setNb_content(nb_content);
		 
		 
		 NoticeBoardDao dao=new NoticeBoardDao();
		 dao.noticeboardUpdate(dto);
		 
		 NoticeActionForward forward=new NoticeActionForward();
		 forward.setPath("noticeboardlist.do");
		 forward.setRedirect(true);
		 
		return forward;
	}

}
