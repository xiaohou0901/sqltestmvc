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

@WebServlet(name = "registerServlet", value = "/register-servlet")
public class RegisterServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//1、获取表单参数
		request.setCharacterEncoding("UTF-8");
		String num = request.getParameter("num");
		String password = request.getParameter("password");
		String name = request.getParameter("name");
		String role = request.getParameter("role");
		HttpSession session = request.getSession();
		if(num==null || "".equals(num.trim())|| password==null|| "".equals(password.trim())||name==null|| "".equals(name.trim())) {
			session.setAttribute("message", "输入有误");
			request.getRequestDispatcher("WEB-INF/register.jsp").forward(request,response);
			return;
		}
		//2、user

		User user = new User( name,  num,  password,  role);

		//3、创建Service方法
		IUserService service = new UserServiceImpl();
		//4、调用Service的saveStudent()方法写入到DB
		Integer id=service.saveUser(user);
		System.out.println("id="+id);
		//5、写入失败则跳转到注册页面
		if(id==null) {
			request.getRequestDispatcher("WEB-INF/register.jsp").forward(request,response);
			return;
		}
		//6、写入成功则跳转到登录界面
		request.getRequestDispatcher("index.jsp").forward(request,response);
	}

}
