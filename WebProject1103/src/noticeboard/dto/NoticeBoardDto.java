package noticeboard.dto;

import java.io.Serializable;

public class NoticeBoardDto implements Serializable {

	private int nb_num;
	private String nb_subject;
	private String nb_pwd;
	private String nb_content;
	private String nb_writer;
	private String nb_date;
	private int nb_readcount;
	
	public NoticeBoardDto(){}

	public int getNb_num() {
		return nb_num;
	}

	public void setNb_num(int nb_num) {
		this.nb_num = nb_num;
	}

	public String getNb_subject() {
		return nb_subject;
	}

	public void setNb_subject(String nb_subject) {
		this.nb_subject = nb_subject;
	}

	public String getNb_pwd() {
		return nb_pwd;
	}

	public void setNb_pwd(String nb_pwd) {
		this.nb_pwd = nb_pwd;
	}

	public String getNb_content() {
		return nb_content;
	}

	public void setNb_content(String nb_content) {
		this.nb_content = nb_content;
	}

	public String getNb_writer() {
		return nb_writer;
	}

	public void setNb_writer(String nb_writer) {
		this.nb_writer = nb_writer;
	}

	public String getNb_date() {
		return nb_date;
	}

	public void setNb_date(String nb_date) {
		this.nb_date = nb_date;
	}

	public int getNb_readcount() {
		return nb_readcount;
	}

	public void setNb_readcount(int nb_readcount) {
		this.nb_readcount = nb_readcount;
	}


}
