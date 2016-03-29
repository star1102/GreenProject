package command;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import db.RegisterDBBean;
import db.RegisterDataBean;

public class LoginProcAction implements CommandAction {

	@Override
	public ForwardAction process(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = req.getParameter("id");
		String pwd = req.getParameter("pwd");
		
		RegisterDataBean bean = new RegisterDataBean();
		RegisterDBBean db = RegisterDBBean.getInstance();
		bean.setId(id);
		bean.setPwd(pwd);
		
		int check = db.loginCheck(bean); // 리턴값이 1이면 로그인을 시키고 0이면 로그인 불가
		
		ForwardAction forward = new ForwardAction();
		
		//System.out.println(check);
		
		req.setAttribute("check", check);
		forward.setPath("/idCheck.jsp");
		return forward;
		
	}
}
