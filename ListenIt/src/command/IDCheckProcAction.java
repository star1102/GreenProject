package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.RegisterDBBean;
import db.RegisterDataBean;

public class IDCheckProcAction implements CommandAction {

	@Override
	public ForwardAction process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {

		String id = req.getParameter("id");
		RegisterDataBean bean = new RegisterDataBean();
		RegisterDBBean DB = RegisterDBBean.getInstance();
		
		bean.setId(id);
		int check = DB.checkID(bean);
		//System.out.println(check);
		req.setAttribute("check" , check);
		
		ForwardAction forward = new ForwardAction();
		forward.setPath("/idCheck.jsp");

		
		return forward;
	}

}
