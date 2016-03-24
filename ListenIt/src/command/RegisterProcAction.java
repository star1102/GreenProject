package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.RegisterDBBean;
import db.RegisterDataBean;


public class RegisterProcAction implements CommandAction {

	@Override
	public ForwardAction process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
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
		System.out.println(result);
		ForwardAction forward = new ForwardAction();
		
		
		
		if(result == 1){	//회원가입 성공
			forward.setPath("/ListenIt/loginForm.jsp");
			forward.setRedirect(true);
			return forward;
		}else{				//실패
			forward.setPath("/ListenIt/registerForm.jsp");
			forward.setRedirect(true);
			return forward;
		}
	}
}