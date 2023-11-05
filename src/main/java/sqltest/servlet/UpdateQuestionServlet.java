package sqltest.servlet;

import sqltest.pojo.*;
import sqltest.service.IUserService;
import sqltest.service.UserServiceImpl;
import sqltest.util.SQLValidator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "updateQuestionServlet", value = "/updateQuestion-servlet")
public class UpdateQuestionServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String oneQuestionId = req.getParameter("questionId");
        String userId = req.getParameter("userId");
        String userSql = req.getParameter("userSql");
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        ResultSetMetaData rsmd;

        int count;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/sqltest";
            String username="root";
            String pwd="123456";
            conn= DriverManager.getConnection(url,username,pwd);
            stmt=conn.createStatement();
            stmt.executeUpdate(userSql);

            req.setAttribute("userSql",userSql);
            req.getRequestDispatcher("WEB-INF/update.jsp").forward(req,resp);

        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            req.getRequestDispatcher("WEB-INF/error.jsp").forward(req,resp);

        }finally{
            if(rs!=null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }
            }
            if(stmt!=null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }
            if(conn!=null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }
        }
    }


}
