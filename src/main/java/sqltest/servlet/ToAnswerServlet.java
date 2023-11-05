package sqltest.servlet;

import sqltest.pojo.*;
import sqltest.service.IUserService;
import sqltest.service.UserServiceImpl;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import javax.servlet.http.HttpServlet;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "toAnswerServlet", value = "/toAnswer-servlet")
public class ToAnswerServlet  extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String questionId = req.getParameter("questionId");

        String userId = req.getParameter("userId");
        Integer id=new Integer(userId);
        IUserService userService = new UserServiceImpl();
        User user = userService.selectUserById(id);
        req.setAttribute("user",user);

        System.out.println(questionId);
        Connection conn=null;
        Statement stmt=null;
        ResultSet rs=null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url="jdbc:mysql://127.0.0.1:3306/sqltest";
            String username="root";
            String pwd="123456";
            conn= DriverManager.getConnection(url,username,pwd);
            stmt=conn.createStatement();
            String sql="SELECT * FROM sqltest.questions where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,questionId);
            rs = ps.executeQuery();

            //List<Questions> questionList=new ArrayList<>();
            Questions oneQuestions=new Questions();
            while(rs.next()) {
                oneQuestions.setId(rs.getString("id"));
                oneQuestions.setQuestion(rs.getString("question"));
                oneQuestions.setAnswer(rs.getString("answer"));
            }
            HttpSession session = req.getSession();
            req.setAttribute("oneQuestions",oneQuestions);


            sql="SELECT * FROM sqltest.student ";
            rs = stmt.executeQuery(sql);
            List<Student> studentList=new ArrayList<>();
            Student student = new Student();
            while(rs.next()){
                student.setS_id(rs.getString("s_id"));
                student.setS_name(rs.getString("s_name"));
                student.setS_birth(rs.getString("s_birth"));
                student.setS_sex(rs.getString("s_sex"));
                studentList.add(student);
            }
            req.setAttribute("studentList",studentList);
/*
            for(Student s:studentList){
                System.out.println(s);
            }*/

            sql="SELECT * FROM sqltest.teacher ";
            rs = stmt.executeQuery(sql);
            List<Teacher> teacherList=new ArrayList<>();
            Teacher teacher = new Teacher();
            while(rs.next()){
                teacher.setT_id(rs.getString("t_id"));
                teacher.setT_name(rs.getString("t_name"));
                teacherList.add(teacher);
            }
            req.setAttribute("teacherList",teacherList);
           /* for(Teacher t:teacherList){
                System.out.println(t);

            }*/


            sql="SELECT * FROM sqltest.course ";
            rs = stmt.executeQuery(sql);
            List<Course> courseList=new ArrayList<>();
            Course course = new Course();
            while(rs.next()){
                course.setC_id(rs.getString("c_id"));
                course.setC_name(rs.getString("c_name"));
                course.setT_id(rs.getString("t_id"));
                courseList.add(course);
            }
            req.setAttribute("courseList",courseList);
/*
            for(Course c:courseList){
                System.out.println(c);
            }*/
            sql="SELECT * FROM sqltest.score ";
            rs = stmt.executeQuery(sql);
            List<Score> scoreList=new ArrayList<>();
            Score score = new Score();
            while(rs.next()){
                score.setS_id(rs.getString("s_id"));
                score.setC_id(rs.getString("c_id"));
                score.setS_score(rs.getString("s_score"));
                scoreList.add(score);
            }
            req.setAttribute("scoreList",scoreList);

            /*for(Score s :scoreList){

                System.out.println(s);
            }*/

            req.getRequestDispatcher("WEB-INF/answer.jsp").forward(req,resp);
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
