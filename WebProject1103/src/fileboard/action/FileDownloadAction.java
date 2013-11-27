package fileboard.action;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class FileDownloadAction implements FileAction {

	@Override
	public FileActionFoward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		// TODO Auto-generated method stub

		String filename = request.getParameter("file_name");
		String dataDir = "c:\\data";
		File file = new File(dataDir, filename);

		if (file.exists()) {
			response.setContentType("application/octet-stream");

			// String sEncoding = new String(filename.getBytes("utf-8"), "8859_1");
			// response.setHeader("Content-Disposition", "attachment; filename=" + sEncoding);
			
			// 학원방식
			response.addHeader("Content-Disposition", "attachment;filename=" + java.net.URLEncoder.encode(filename, "utf-8"));
			
			byte[] buffer = new byte[1024];

			FileInputStream fis = null;
			BufferedInputStream bis = null;
			
			try {
				fis = new FileInputStream(file);
				bis = new BufferedInputStream(fis);
				OutputStream out = response.getOutputStream();
				int i = bis.read(buffer);
				while (i != -1) {
					out.write(buffer, 0, i);
					i=bis.read(buffer);
				}
				
			} catch (Exception e) {
				//e.printStackTrace();
				System.out.println("다운로드 취소");
			}
			finally{
				if (bis != null) {
					bis.close();
				}
				if (fis != null) {
					fis.close();
				}
			}
		}
		
		System.out.println(filename + " 파일 다운로드 성공!");

		FileActionFoward forward = new FileActionFoward();
		forward.setPath("fileboardlist.do");
		forward.setRedirect(false);
		
		return forward;
	}

}
