package sqltest.servlet;

import sqltest.pojo.User;
import sqltest.service.IUserService;
import sqltest.service.UserServiceImpl;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


@WebServlet(name = "loginServlet", value = "/login-servlet")
public class LoginServlet extends HttpServlet {
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、接收请求参数
		String num = request.getParameter("num");
		String password = request.getParameter("password");
		//获取session
		HttpSession session = request.getSession();
		if(num==null || "".equals(num.trim()) ) {
			session.setAttribute("message", "学号输入有误");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
		if(password==null || "".equals(password.trim()) ) {
			session.setAttribute("message", "密码输入有误");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
		//2、创建Service对象
		IUserService service=new UserServiceImpl();
		//3、 调用Service对象的checkUser()方法对用户进行验证
		User user=service.checkUser(num,password);
		//4、验证失败，跳转到login.jsp让用户再次输入登录信息。此时页面需要给出用户一些提示
		if(user==null) {
			session.setAttribute("message", "学号或密码输入有误");
			response.sendRedirect(request.getContextPath()+"/index.jsp");
			return;
		}
		//5、验证通过，跳转到index.jsp
		//response.sendRedirect("/WEB-INF/head.jsp");
		session.setAttribute("user", user);
		if(user.getRole().equals("1")){
			request.getRequestDispatcher("WEB-INF/headT.jsp").forward(request,response);
		}
		request.getRequestDispatcher("WEB-INF/head.jsp").forward(request,response);
	}
}
