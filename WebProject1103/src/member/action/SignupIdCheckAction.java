package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;

public class SignupIdCheckAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("m_id");
		
		MemberDao dao = new MemberDao();
		int count = dao.memberIdCheck(id);
		if(count == 0) request.setAttribute("result", "0");
		else request.setAttribute("result", "1");
		
		MemberActionForward forward = new MemberActionForward();
		forward.setPath("Sign/memberIdCheckResult.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
