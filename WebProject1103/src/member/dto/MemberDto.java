package member.dto;

import java.io.Serializable;

public class MemberDto implements Serializable {

	private String m_name;
	private String m_id;
	private String m_pwd;
	private String m_email;
	private String m_emailAllow;
	private String m_birthDate;
	private String m_lunarSolar;
	private String m_sex;
	private String m_phone;
	private String m_cphone;
	private String m_smsAllow;
	private String m_addr;
	private int m_grade;
	
	public MemberDto(){}

	public MemberDto(String m_name, String m_id, String m_pwd, String m_email,
			String m_emailAllow, String m_birthDate, String m_lunarSolar,
			String m_sex, String m_phone, String m_cphone, String m_smsAllow,
			String m_addr, int m_grade) {
		super();
		this.m_name = m_name;
		this.m_id = m_id;
		this.m_pwd = m_pwd;
		this.m_email = m_email;
		this.m_emailAllow = m_emailAllow;
		this.m_birthDate = m_birthDate;
		this.m_lunarSolar = m_lunarSolar;
		this.m_sex = m_sex;
		this.m_phone = m_phone;
		this.m_cphone = m_cphone;
		this.m_smsAllow = m_smsAllow;
		this.m_addr = m_addr;
		this.m_grade = m_grade;
	}

	public String getM_name() {
		return m_name;
	}

	public void setM_name(String m_name) {
		this.m_name = m_name;
	}

	public String getM_id() {
		return m_id;
	}

	public void setM_id(String m_id) {
		this.m_id = m_id;
	}

	public String getM_pwd() {
		return m_pwd;
	}

	public void setM_pwd(String m_pwd) {
		this.m_pwd = m_pwd;
	}

	public String getM_email() {
		return m_email;
	}

	public void setM_email(String m_email) {
		this.m_email = m_email;
	}

	public String getM_emailAllow() {
		return m_emailAllow;
	}

	public void setM_emailAllow(String m_emailAllow) {
		this.m_emailAllow = m_emailAllow;
	}

	public String getM_birthDate() {
		return m_birthDate;
	}

	public void setM_birthDate(String m_birthDate) {
		this.m_birthDate = m_birthDate;
	}

	public String getM_lunarSolar() {
		return m_lunarSolar;
	}

	public void setM_lunarSolar(String m_lunarSolar) {
		this.m_lunarSolar = m_lunarSolar;
	}

	public String getM_sex() {
		return m_sex;
	}

	public void setM_sex(String m_sex) {
		this.m_sex = m_sex;
	}

	public String getM_phone() {
		return m_phone;
	}

	public void setM_phone(String m_phone) {
		this.m_phone = m_phone;
	}

	public String getM_cphone() {
		return m_cphone;
	}

	public void setM_cphone(String m_cphone) {
		this.m_cphone = m_cphone;
	}

	public String getM_smsAllow() {
		return m_smsAllow;
	}

	public void setM_smsAllow(String m_smsAllow) {
		this.m_smsAllow = m_smsAllow;
	}

	public String getM_addr() {
		return m_addr;
	}

	public void setM_addr(String m_addr) {
		this.m_addr = m_addr;
	}

	public int getM_grade() {
		return m_grade;
	}

	public void setM_grade(int m_grade) {
		this.m_grade = m_grade;
	}

	
	
}
