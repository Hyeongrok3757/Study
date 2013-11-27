package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import member.dao.MemberDao;
import member.dto.MemberDto;
import member.dto.MemberSearchDto;

public class MemberCertificationAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("euc-kr");

		String id = request.getParameter("m_id");
		String pwd = request.getParameter("m_pwd");
		
		MemberSearchDto dto = new MemberSearchDto(id, pwd);
		
		MemberDao dao = new MemberDao();
		MemberDto result_dto = dao.memberSearch(dto);
		
		MemberActionForward forward = new MemberActionForward();
		
		if(result_dto != null){
			HttpSession session = request.getSession();
			String result = "yes";
			session.setAttribute("login_check", result);
			session.setAttribute("logged_id", id);
			String result_grade = String.valueOf(result_dto.getM_grade());
			session.setAttribute("logged_grade", result_grade);
			forward.setPath("main.do");
			forward.setRedirect(true);
		}else{
			forward.setPath("main.do");
			forward.setRedirect(true);
		}

		return forward;
	}

}
