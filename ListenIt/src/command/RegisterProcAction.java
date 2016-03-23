package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.RegisterDBBean;
import db.RegisterDataBean;


public class RegisterProcAction implements CommandAction {

	@Override
	public String process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		String birth_date = req.getParameter("birth_date");
		String email = req.getParameter("email");
		
		RegisterDataBean bean = new RegisterDataBean();
		RegisterDBBean DB = RegisterDBBean.getInstance();
		bean.setId(id);
		bean.setPwd(pwd);
		bean.setBirth_date(birth_date);
		bean.setEmail(email);
		
		int result = DB.insertMember(bean);
		req.setAttribute("result" , result);
		
		if(result == 0){
			return "/registerForm.jsp";
		}else{
			return "/loginForm.jsp";
		}
	}

}