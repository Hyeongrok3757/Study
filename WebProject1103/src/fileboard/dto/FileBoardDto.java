package fileboard.dto;

import java.io.Serializable;

public class FileBoardDto implements Serializable {

	private int file_num;
	private String file_name;
	private String file_pwd;
	private String file_size;
	private String file_uploader;
	private String file_date;
	private String file_fileimagesrc;
	private int file_count;

	public FileBoardDto() {
	}

	public FileBoardDto(int file_num, String file_name, String file_pwd,
			String file_size, String file_uploader, String file_date,
			String file_fileimagesrc, int file_count) {
		super();
		this.file_num = file_num;
		this.file_name = file_name;
		this.file_pwd = file_pwd;
		this.file_size = file_size;
		this.file_uploader = file_uploader;
		this.file_date = file_date;
		this.file_fileimagesrc = file_fileimagesrc;
		this.file_count = file_count;
	}

	public int getFile_num() {
		return file_num;
	}

	public void setFile_num(int file_num) {
		this.file_num = file_num;
	}

	public String getFile_name() {
		return file_name;
	}

	public void setFile_name(String file_name) {
		this.file_name = file_name;
	}

	public String getFile_pwd() {
		return file_pwd;
	}

	public void setFile_pwd(String file_pwd) {
		this.file_pwd = file_pwd;
	}

	public String getFile_size() {
		return file_size;
	}

	public void setFile_size(String file_size) {
		this.file_size = file_size;
	}

	public String getFile_uploader() {
		return file_uploader;
	}

	public void setFile_uploader(String file_uploader) {
		this.file_uploader = file_uploader;
	}

	public String getFile_date() {
		return file_date;
	}

	public void setFile_date(String file_date) {
		this.file_date = file_date;
	}

	public String getFile_fileimagesrc() {
		return file_fileimagesrc;
	}

	public void setFile_fileimagesrc(String file_fileimagesrc) {
		this.file_fileimagesrc = file_fileimagesrc;
	}

	public int getFile_count() {
		return file_count;
	}

	public void setFile_count(int file_count) {
		this.file_count = file_count;
	}

}
