package sqltest.servlet;

import java.io.*;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import javax.servlet.annotation.*;

@WebServlet(name = "helloServlet", value = "/hello-servlet")
public class HelloServlet extends HttpServlet {
    private String message;

    public void init() {
        message = "Hello World!";
    }

    public void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        response.setContentType("text/html");

        // Hello
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h1>" + message + "</h1>");
        out.println("</body></html>");
    }
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        //3.通过request对象获取JSP页面利用超链接送来的三边的参数，送给字符a,b,c
        String a = request.getParameter("sideA");
        String b = request.getParameter("sideB");
        String c = request.getParameter("sideC");
        System.out.println(a+b+c);
    }

    public void destroy() {
    }
}