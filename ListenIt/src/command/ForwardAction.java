package command;

public class ForwardAction {
	private boolean isRedirect = false;
	private String path;

	public boolean getRedirect(){
		return isRedirect;
	}

	public void setRedirect(boolean b){
		isRedirect = b;
	}

	public String getPath(){
		return path;
	}

	public void setPath(String str){
		path = str;
	}
}