package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UploadFormAction implements CommandAction {
 
	@Override
	public ForwardAction process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		ForwardAction forward = new ForwardAction();
		forward.setPath("/uploadForm.jsp");
		return forward;
	}

}
