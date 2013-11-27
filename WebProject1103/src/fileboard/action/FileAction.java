package fileboard.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface FileAction {
	
	public FileActionFoward execute(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException;

}
