package sqltest.servlet;

import sqltest.pojo.Order;
import sqltest.pojo.Questions;
import sqltest.pojo.User;
import sqltest.service.IUserService;
import sqltest.service.UserServiceImpl;

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

@WebServlet(name = "toRecordServlet", value = "/toRecord-servlet")
public class ToRecordServlet extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String userId = req.getParameter("userId");
        Integer id=new Integer(userId);
        IUserService userService = new UserServiceImpl();
        User user = userService.selectUserById(id);
        req.setAttribute("user",user);
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;
        PreparedStatement ps=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/sqltest";
            String username="root";
            String pwd="123456";
            conn=DriverManager.getConnection(url,username,pwd);

            stmt=conn.createStatement();
            String sql="SELECT * FROM sqltest.order where uid=?";
            ps=conn.prepareStatement(sql);
            ps.setInt(1,id);
            rs = ps.executeQuery();
            List<Order> orderList=new ArrayList<>();
            while(rs.next()) {
                Order order=new Order();
                order.setUid(rs.getInt("uid"));
                order.setQid(rs.getInt("qid"));
                order.setTime(rs.getInt("time"));
                orderList.add(order);
            }
            for (Order o:orderList){
                System.out.println(o);
            }
            HttpSession session = req.getSession();
            req.setAttribute("orderList",orderList);
            req.getRequestDispatcher("WEB-INF/record.jsp").forward(req,resp);

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
            if(ps!=null) {
                try {
                    ps.close();
                } catch (SQLException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

            }
        }
    }

}
