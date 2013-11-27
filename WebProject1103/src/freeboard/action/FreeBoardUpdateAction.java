package freeboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import freeboard.dao.FreeBoardDao;
import freeboard.dto.FreeBoardDto;

public class FreeBoardUpdateAction implements Action{

	@Override                    //Model(dto)�� �����ϴ� ���(��)
	public ActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("euc-kr");
		
		 String fb_num=request.getParameter("fb_num");
		 String fb_subject=request.getParameter("fb_subject");
		 String fb_content=request.getParameter("fb_content");
		 
		 FreeBoardDto dto=new FreeBoardDto();//DI(����������)������� ���� 
		 
		 dto.setFb_num(Integer.parseInt(fb_num));
		 dto.setFb_subject(fb_subject);
		 dto.setFb_content(fb_content);
		 
		 
		 FreeBoardDao dao=new FreeBoardDao();
		 dao.freeboardUpdate(dto);
		 
		 ActionForward forward=new ActionForward();
		 forward.setPath("freeboardlist.do");
		 forward.setRedirect(true);
		 
		return forward;
	}

}
