package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;

public class SignupEmailCheckAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String email = request.getParameter("email");
		
		MemberDao dao = new MemberDao();
		int check = dao.memberEmailCheck(email);
		if(check==0) request.setAttribute("result", "0");
		else request.setAttribute("result", "1");
		
		MemberActionForward forward = new MemberActionForward();
		forward.setPath("Sign/memberEmailCheckResult.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}
