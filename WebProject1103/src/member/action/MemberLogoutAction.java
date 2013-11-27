package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;

public class MemberLogoutAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {

		HttpSession session = request.getSession();
		session.removeAttribute("login_check");
		session.removeAttribute("login_id");
		
		MemberActionForward forward = new MemberActionForward();
		forward.setPath("main.do");
		forward.setRedirect(true);
		
		return forward;
	}

}
