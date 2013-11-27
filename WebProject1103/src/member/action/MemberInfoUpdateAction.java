package member.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import member.dao.MemberDao;
import member.dto.MemberDto;

public class MemberInfoUpdateAction implements MemberAction {

	@Override
	public MemberActionForward execute(HttpServletRequest request,
			HttpServletResponse response) throws IOException, ServletException {
		
		request.setCharacterEncoding("euc-kr");
		
		String m_name = request.getParameter("m_name");
		String m_id = request.getParameter("m_id");
		String m_pwd = request.getParameter("m_pwd");

		String m_email = request.getParameter("m_email1") + '@' + request.getParameter("m_email2");

		String m_emailAllow = request.getParameter("m_emailAllow");
		if (m_emailAllow == null)
			m_emailAllow = "false";
		else m_emailAllow = "true";

		String m_birthDate;
		String m_birthDate1 = request.getParameter("m_birthdate1").trim();
		String m_birthDate2 = request.getParameter("m_birthdate2").trim();
		String m_birthDate3 = request.getParameter("m_birthdate3").trim();
		if (m_birthDate1 == "" || m_birthDate2 == "" || m_birthDate3 == "") {
			m_birthDate = "";
		} else {
			m_birthDate = m_birthDate1 + "년 " + m_birthDate2 + "월 " + m_birthDate3 + "일";
		}

		String m_lunarSolar = request.getParameter("m_lunarSolar");
		if (m_lunarSolar == null)
			m_lunarSolar = "solar";
		else m_lunarSolar = "lunar";
		String m_sex = request.getParameter("m_sex");

		String m_phone;
		String m_phone1 = request.getParameter("m_tel1").trim();
		String m_phone2 = request.getParameter("m_tel2").trim();
		String m_phone3 = request.getParameter("m_tel3").trim();
		if (m_phone1 == "" || m_phone2 == "" || m_phone3 == "") {
			m_phone = "";
		} else {
			m_phone = m_phone1 + " - " + m_phone2 + " - " + m_phone3;
		}

		String m_cphone;
		String m_cphone1 = request.getParameter("m_mobile1").trim();
		String m_cphone2 = request.getParameter("m_mobile2").trim();
		String m_cphone3 = request.getParameter("m_mobile3").trim();
		if (m_cphone1 == "" || m_cphone2 == "" || m_cphone3 == "") {
			m_cphone = "";
		} else {
			m_cphone = m_cphone1 + " - " + m_cphone2 + " - " + m_cphone3;
		}
		
		String m_smsAllow = request.getParameter("m_smsAllow");
		if (m_smsAllow == null)
			m_smsAllow = "false";
		else m_smsAllow = "true";

		String zipcode;
		String user_zipcode1 = request.getParameter("user_zipcode1");
		String user_zipcode2 = request.getParameter("user_zipcode2");
		if(user_zipcode1 == "" || user_zipcode2 == ""){
			zipcode = "";
		}else{
			zipcode = user_zipcode1 + " - " + user_zipcode2;
		}
		
		String m_addr;
		String m_addr1 = request.getParameter("m_addr_base").trim();
		String m_addr2 = request.getParameter("m_addr_etc").trim();
		if(m_addr1 == "" || m_addr2 == ""){
			m_addr = "";
		}else {
			m_addr = m_addr1 + " - " + m_addr2;
		}

		m_addr = zipcode + " : " + m_addr;
		
		
		int m_grade = Integer.parseInt(request.getParameter("m_grade"));

		System.out.println("회원정보 수정요청 내용 => " + m_name + '#' + m_id + '#' + m_pwd
				+ '#' + m_email + '#' + m_emailAllow + '#' + m_birthDate + '#'
				+ m_lunarSolar + '#' + m_sex + '#' + m_phone + '#' + m_cphone
				+ '#' + m_smsAllow + '#' + m_addr + '#' + m_grade);
		
		MemberDto dto = new MemberDto(m_name, m_id, m_pwd, m_email, m_emailAllow, m_birthDate, m_lunarSolar, m_sex, m_phone, m_cphone, m_smsAllow, m_addr, m_grade);

		MemberDao dao = new MemberDao();
		int check = dao.memberUpdate(dto);

		MemberActionForward forward = new MemberActionForward();
		if (check == 0) {
			System.out.println("회원정보 수정실패");
			forward.setPath("memberInfoUpdateForm.do");
			forward.setRedirect(true);
		} else {
			System.out.println("회원정보 수정완료");
			forward.setPath("main.do");
			forward.setRedirect(true);
		}

		return forward;
	}

}
