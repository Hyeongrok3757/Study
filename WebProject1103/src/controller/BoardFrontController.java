package controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.action.MemberAction;
import member.action.MemberActionForward;
import member.action.MemberCertificationAction;
import member.action.MemberInfoUpdateAction;
import member.action.MemberInfoUpdateFormAction;
import member.action.MemberInsertAction;
import member.action.MemberLogoutAction;
import member.action.SignupEmailCheckAction;
import member.action.SignupIdCheckAction;
import noticeboard.action.NoticeAction;
import noticeboard.action.NoticeActionForward;
import noticeboard.action.NoticeBoardDeleteAction;
import noticeboard.action.NoticeBoardDetailAction;
import noticeboard.action.NoticeBoardInsertAction;
import noticeboard.action.NoticeBoardListAction;
import noticeboard.action.NoticeBoardSearchAction;
import noticeboard.action.NoticeBoardSelectListAction;
import noticeboard.action.NoticeBoardUpdateAction;
import noticeboard.action.NoticeBoardUpdateFormAction;
import fileboard.action.FileAction;
import fileboard.action.FileActionFoward;
import fileboard.action.FileBoardInsertAction;
import fileboard.action.FileBoardListAction;
import fileboard.action.FileDownloadAction;
import freeboard.action.Action;
import freeboard.action.ActionForward;
import freeboard.action.FreeBoardDeleteAction;
import freeboard.action.FreeBoardDetailAction;
import freeboard.action.FreeBoardInsertAction;
import freeboard.action.FreeBoardListAction;
import freeboard.action.FreeBoardSearchAction;
import freeboard.action.FreeBoardSelectListAction;
import freeboard.action.FreeBoardUpdateAction;
import freeboard.action.FreeBoardUpdateFormAction;
import freeboard.action.MainListAction1;

@WebServlet("*.do")
@MultipartConfig(maxFileSize=1024*1024*20,location="c:\\data") // 폴더는 미리 생성되어 있어야함
// @MultipartConfig  시 기본경로 .metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\해당프로젝트폴더 
public class BoardFrontController extends HttpServlet {

	protected void service(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String uri = request.getRequestURI();
		// System.out.println("uri="+uri);
		String ctx = request.getContextPath();
		// System.out.println("ctx="+ctx);
		String path = uri.substring(ctx.length());
		int lastindex = path.lastIndexOf('/');
		String command = path.substring(lastindex);
		System.out.println("command=" + command);

		Action freeboard_action = null;
		ActionForward freeboard_forward = null;

		if (command.equals("/main.do")) {

			freeboard_action = new MainListAction1();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardlist.do")) {

			freeboard_action = new FreeBoardListAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardwrite.do")) {

			freeboard_forward = new ActionForward();
			freeboard_forward.setPath("freeboard/freeboardinsert.jsp");
			freeboard_forward.setRedirect(false);

		} else if (command.equals("/freeboardinsert.do")) {

			freeboard_action = new FreeBoardInsertAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboarddetail.do")) {

			freeboard_action = new FreeBoardDetailAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboarddelete.do")) {

			freeboard_action = new FreeBoardDeleteAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardupdateform.do")) {

			freeboard_action = new FreeBoardUpdateFormAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardupdate.do")) {

			freeboard_action = new FreeBoardUpdateAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardsearch.do")) {

			freeboard_action = new FreeBoardSearchAction();
			freeboard_forward = freeboard_action.execute(request, response);

		} else if (command.equals("/freeboardselectlist.do")) {

			freeboard_action = new FreeBoardSelectListAction();
			freeboard_forward = freeboard_action.execute(request, response);

		}

		if (freeboard_forward != null) {
			if (freeboard_forward.isRedirect()) { // true
				response.sendRedirect(freeboard_forward.getPath());
			} else { // false
				RequestDispatcher rd = request
						.getRequestDispatcher(freeboard_forward.getPath());
				rd.forward(request, response);
			}
		}

		// ------------------------------------------------------------------------------------------------------------
		// 회원처리용
		MemberAction member_action = null;
		MemberActionForward member_forward = null;

		// Sing_up begin
		if (command.equals("/memberInsert.do")) {

			member_action = new MemberInsertAction();
			member_forward = member_action.execute(request, response);

		} else if (command.equals("/memberInfoUpdateForm.do")) {
			
			member_action = new MemberInfoUpdateFormAction();
			member_forward = member_action.execute(request, response);
			
		} else if (command.equals("/memberInfoUpdate.do")) {
		
			member_action = new MemberInfoUpdateAction();
			member_forward = member_action.execute(request, response);
		
		} else if (command.equals("/login_process.do")) {

			member_action = new MemberCertificationAction();
			member_forward = member_action.execute(request, response);

		} else if (command.equals("/logout.do")) {

			member_action = new MemberLogoutAction();
			member_forward = member_action.execute(request, response);

		} else if (command.equals("/signup.do")) {

			member_forward = new MemberActionForward();
			member_forward.setPath("Sign/middle_right_signup.jsp");
			member_forward.setRedirect(false);

		} else if (command.equals("/signup_info.do")) {

			member_forward = new MemberActionForward();
			member_forward.setPath("Sign/middle_right_signup_info.jsp");
			member_forward.setRedirect(false);

		} else if (command.equals("/signup_permission.do")) {

			member_forward = new MemberActionForward();
			member_forward.setPath("Sign/middle_right_signup_permission.jsp");
			member_forward.setRedirect(false);

		} else if (command.equals("/login.do")) {

			member_forward = new MemberActionForward();
			member_forward.setPath("Sign/middle_right_login.jsp");
			member_forward.setRedirect(false);

		} else if (command.equals("/sitemap.do")) {

			member_forward = new MemberActionForward();
			member_forward.setPath("sitemap.jsp");
			member_forward.setRedirect(false);

		} else if (command.equals("/signup_chk_id.do")) {

			member_action = new SignupIdCheckAction();
			member_forward = member_action.execute(request, response);

		} else if (command.equals("/signup_chk_email.do")) {

			member_action = new SignupEmailCheckAction();
			member_forward = member_action.execute(request, response);

		}

		if (member_forward != null) {
			if (member_forward.isRedirect()) {
				response.sendRedirect(member_forward.getPath());
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher(member_forward.getPath());
				rd.forward(request, response);
			}
		}

		// ----------------------------------------------------------------------------------------------
		NoticeAction notice_action = null;
		NoticeActionForward notice_forward = null;

		if (command.equals("/noticeboardlist.do")) {

			notice_action = new NoticeBoardListAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboardwrite.do")) {

			notice_forward = new NoticeActionForward();
			notice_forward.setPath("noticeboard/noticeboardinsert.jsp");
			notice_forward.setRedirect(false);

		} else if (command.equals("/noticeboardinsert.do")) {

			notice_action = new NoticeBoardInsertAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboarddetail.do")) {

			notice_action = new NoticeBoardDetailAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboarddelete.do")) {

			notice_action = new NoticeBoardDeleteAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboardupdateform.do")) {

			notice_action = new NoticeBoardUpdateFormAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboardupdate.do")) {

			notice_action = new NoticeBoardUpdateAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboardsearch.do")) {

			notice_action = new NoticeBoardSearchAction();
			notice_forward = notice_action.execute(request, response);

		} else if (command.equals("/noticeboardselectlist.do")) {

			notice_action = new NoticeBoardSelectListAction();
			notice_forward = notice_action.execute(request, response);

		}

		if (notice_forward != null) {
			if (notice_forward.isRedirect()) { // true
				response.sendRedirect(notice_forward.getPath());
			} else { // false
				RequestDispatcher rd = request
						.getRequestDispatcher(notice_forward.getPath());
				rd.forward(request, response);
			}
		}

		// ------------------------------------------------------------------------------------------------------------
		// 파일처리용
		FileAction file_action = null;
		FileActionFoward file_forward = null;

		// Sing_up begin
		if (command.equals("/fileboardlist.do")) {

			file_action = new FileBoardListAction();
			file_forward = file_action.execute(request, response);

		} else if (command.equals("/fileboardwrite.do")) {
			
			file_forward = new FileActionFoward();
			file_forward.setPath("fileboard/fileboardwrite.jsp");
			file_forward.setRedirect(false);

		} else if (command.equals("/fileboardinsert.do")) {
			
			file_action = new FileBoardInsertAction();
			file_forward = file_action.execute(request, response);
			
		} else if (command.equals("/fileDownload.do")) {
			
			file_action = new FileDownloadAction();
			file_forward = file_action.execute(request, response);
			
		}

		if (file_forward != null) {
			if (file_forward.isRedirect()) {
				response.sendRedirect(file_forward.getPath());
			} else {
				RequestDispatcher rd = request
						.getRequestDispatcher(file_forward.getPath());
				rd.forward(request, response);
			}
		}

	}

}
