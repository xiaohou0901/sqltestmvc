package sqltest.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "testServlet", value = "/test-servlet")
public class TestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
       /* String userSql=req.getParameter("userSql");
        HttpSession session = req.getSession();
        System.out.println("userSql");




        session.setAttribute("userSql",userSql);*/
        req.getRequestDispatcher("index.jsp").forward(req,resp);

    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //3.通过request对象获取JSP页面利用超链接送来的三边的参数，送给字符a,b,c
        String a = request.getParameter("question");
        System.out.println(a);
    }
}

