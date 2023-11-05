package sqltest.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
@WebServlet(name = "calculateServlet", value = "/calculate-servlet")
public class CalculateServlet  extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String num=req.getParameter("num");
        HttpSession session = req.getSession();
        Integer num1=new Integer(num);

        String receiveNum="receive" + num;

        session.setAttribute("result",receiveNum);
        req.setAttribute("result",receiveNum);
        req.getRequestDispatcher("index.jsp").forward(req,resp);
        //




    }

}
