package noticeboard.action;

public class NoticeActionForward {

	private String path; // View page
	private boolean isRedirect; // true => sendRedrect, flase => forward

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() { // is ��� �̸����� ������ get ---> is �� ��ȴ�.
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
