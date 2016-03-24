package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public interface CommandAction {
	public ForwardAction  process(HttpServletRequest req, 
										HttpServletResponse res) 
					throws ServletException, IOException;
}
 