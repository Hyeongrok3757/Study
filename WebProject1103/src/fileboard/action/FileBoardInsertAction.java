package fileboard.action;

import java.io.IOException;
import java.util.Collection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import fileboard.dao.FileBoardDao;
import fileboard.dto.FileBoardDto;

@MultipartConfig(maxFileSize=1024*1024*20,location="c:\\data") // 폴더는 미리 생성되어 있어야함
// @MultipartConfig  시 기본경로 .metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\해당프로젝트폴더 
public class FileBoardInsertAction extends HttpServlet implements FileAction {

	@Override
	public FileActionFoward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("euc-kr"); // 요청 처리 전에 해야 함. ★★★
		response.setContentType("text/html; charset=EUC-KR");
		
		// 한개일때
		// form에서 보낸 파일을 getPart()로 받아서 Part 객체로 처리
		// Part part = request.getPart("theFile"); 
		
		Collection<Part> parts = request.getParts(); // interface 임
		
		int count = 0;
		String[] fileName = new String[2];
		int filesize = 0;
		for (Part part : parts) {
			if (part.getContentType() != null) {
				fileName[count] = getFilename(part);
				System.out.println("파일배열에 포함된 이름 : " + fileName[count]);
				if (fileName[count] != null && !fileName[count].isEmpty()) {
					
					// 1. @MultipartConfig에서 위치를 지정하지 않았을 경우( 학원에서 한 방식 )
					// if (fileName[count].indexOf("\\") != -1) {
					// fileName[count] =
					// fileName[count].substring(fileName[count].lastIndexOf("\\")+1);
					// }
					// part.write(getServletContext().getRealPath("/WEB-INF/data")+"/"+fileName[count]);
					
					// 2. @MultipartConfig에서 위치를 지정한 경우 ★★★
					part.write(fileName[count]);
					filesize = (int) part.getSize();
				}
			} else {
				String partName = part.getName();
				String fieldValue = request.getParameter(partName);
				System.out.println("count : " + count + "   null이거나 비었을 경우 > " + partName + ":" + fieldValue);
			}
			count++;
		}
		
		String file_name = fileName[0];
		// Multipart 형식의 Form data는 getBytes()를 이용해 encoding. ★★★
		String file_pwd = request.getParameter("file_pwd");
		//file_pwd = new String(file_pwd.getBytes("iso-8859-1"), "utf-8");
		String file_size = String.valueOf(filesize);
		String file_uploader = request.getParameter("file_uploader"); 
		//file_uploader = new String(file_uploader.getBytes("iso-8859-1"), "utf-8");
		String file_fileimagesrc = fileName[1];
		
		System.out.println("파일 입력정보 > 파일이름:"+file_name+" # 비밀번호:"+file_pwd+" # 사이즈:"+file_size+" # 업로더:"+file_uploader+" # 이미지파일:"+file_fileimagesrc);
		
		FileBoardDto dto = new FileBoardDto();
		dto.setFile_name(file_name);
		dto.setFile_pwd(file_pwd);
		dto.setFile_size(file_size);
		dto.setFile_uploader(file_uploader);
		dto.setFile_fileimagesrc(file_fileimagesrc);
		
		FileBoardDao dao = new FileBoardDao();
		dao.fileboardinsert(dto);
		
		FileActionFoward forward = new FileActionFoward();
		forward.setPath("fileboardlist.do");
		forward.setRedirect(true);
		
		return forward;
	}

	private String getFilename(Part part) {
		// Part의 Header 로 부터 Upload file 명을 Pasing하여 return 한다.
		// content-disposition:form-data:name="document";filename="c:\\data\note.txt"
		String filename = null;
		String contentDispositionHeader = part.getHeader("content-disposition");
		String[] elements = contentDispositionHeader.split(";");

		for (String element : elements) {
			if (element.trim().startsWith("filename")) { 
				filename = element.substring(element.indexOf("=") + 1); 	// 결과 : "c:\\data\note.txt"
				filename = filename.trim().replace("\"", "");				// 결과 : c:\\data\note.txt
				filename = filename.substring(filename.lastIndexOf("\\")+1);// 결과 : note.txt
			}
		}
		return filename;
	}

}