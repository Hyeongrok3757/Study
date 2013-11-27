package freeboard.action;

public class ActionForward {

	private String path; // View page
	private boolean isRedirect; // true => sendRedrect, flase => forward

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	public boolean isRedirect() { // is 라는 이름으로 붙으면 get ---> is 로 생성된다.
		return isRedirect;
	}

	public void setRedirect(boolean isRedirect) {
		this.isRedirect = isRedirect;
	}
}
