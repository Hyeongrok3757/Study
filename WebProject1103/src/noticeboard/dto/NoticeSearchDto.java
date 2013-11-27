package noticeboard.dto;

public class NoticeSearchDto {
	private String search;
	private String key;

	public NoticeSearchDto(){}

	public NoticeSearchDto(String search, String key) {
		super();
		this.search = search;
		this.key = key;
	}

	public String getSearch() {
		return search;
	}

	public void setSearch(String search) {
		this.search = search;
	}

	public String getKey() {
		return key;
	}

	public void setKey(String key) {
		this.key = key;
	}
}
