package freeboard.dto;

import java.io.Serializable;

public class FreeBoardDto implements Serializable {

	private int fb_num;
	private String fb_subject;
	private String fb_pwd;
	private String fb_content;
	private String fb_writer;
	private String fb_date;
	private int fb_readcount;
	
	public FreeBoardDto(){}

	public FreeBoardDto(int fb_num, String fb_subject, String fb_pwd,
			String fb_content, String fb_writer, String fb_date,
			int fb_readcount) {
		super();
		this.fb_num = fb_num;
		this.fb_subject = fb_subject;
		this.fb_pwd = fb_pwd;
		this.fb_content = fb_content;
		this.fb_writer = fb_writer;
		this.fb_date = fb_date;
		this.fb_readcount = fb_readcount;
	}

	public int getFb_num() {
		return fb_num;
	}

	public void setFb_num(int fb_num) {
		this.fb_num = fb_num;
	}

	public String getFb_subject() {
		return fb_subject;
	}

	public void setFb_subject(String fb_subject) {
		this.fb_subject = fb_subject;
	}

	public String getFb_pwd() {
		return fb_pwd;
	}

	public void setFb_pwd(String fb_pwd) {
		this.fb_pwd = fb_pwd;
	}

	public String getFb_content() {
		return fb_content;
	}

	public void setFb_content(String fb_content) {
		this.fb_content = fb_content;
	}

	public String getFb_writer() {
		return fb_writer;
	}

	public void setFb_writer(String fb_writer) {
		this.fb_writer = fb_writer;
	}

	public String getFb_date() {
		return fb_date;
	}

	public void setFb_date(String fb_date) {
		this.fb_date = fb_date;
	}

	public int getFb_readcount() {
		return fb_readcount;
	}

	public void setFb_readcount(int fb_readcount) {
		this.fb_readcount = fb_readcount;
	}
	
}
