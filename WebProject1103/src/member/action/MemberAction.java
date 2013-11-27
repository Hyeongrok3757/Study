package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface MemberAction {
	public MemberActionForward execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;
}
