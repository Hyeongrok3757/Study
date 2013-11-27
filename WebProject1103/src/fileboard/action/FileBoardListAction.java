package fileboard.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import fileboard.dao.FileBoardDao;
import fileboard.dto.FileBoardDto;

public class FileBoardListAction implements FileAction {

	@Override
	public FileActionFoward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		FileBoardDao dao = new FileBoardDao();
		List<FileBoardDto> list = dao.getAllList();
		
		request.setAttribute("fileboardlist", list);
		
		FileActionFoward forward = new FileActionFoward();
		forward.setPath("fileboard/fileboardlist.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
