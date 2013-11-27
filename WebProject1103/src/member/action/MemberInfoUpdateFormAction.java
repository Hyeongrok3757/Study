package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDao;
import member.dto.MemberDto;

import org.apache.catalina.Session;

public class MemberInfoUpdateFormAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("logged_id");
		
		MemberDao dao = new MemberDao();
		MemberDto dto = dao.memberSearch(id);

		request.setAttribute("memberDto", dto);
		
		MemberActionForward forward = new MemberActionForward();
		forward.setPath("Sign/memberInfoUpdate.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
