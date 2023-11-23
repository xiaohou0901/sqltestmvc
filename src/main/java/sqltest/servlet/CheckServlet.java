package sqltest.servlet;

import sqltest.pojo.*;
import sqltest.service.IOrderService;
import sqltest.service.IUserService;
import sqltest.service.OrderServiceImpl;
import sqltest.service.UserServiceImpl;
import sqltest.util.JDBCUtils;
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

@WebServlet(name = "checkServlet", value = "/check-servlet")
public class CheckServlet extends HttpServlet {
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
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
            String sql="SELECT * FROM sqltest.questions where id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1,oneQuestionId);
            rs = ps.executeQuery();
            Questions oneQuestions=new Questions();
            while(rs.next()) {
                oneQuestions.setId(rs.getString("id"));
                oneQuestions.setQuestion(rs.getString("question"));
                oneQuestions.setAnswer(rs.getString("answer"));
            }
            req.setAttribute("oneQuestions",oneQuestions);

            if(!SQLValidator.validateSQL(userSql)){
                System.out.println("sql语句有误");
                req.setAttribute("result","sql语句有误");
                HttpSession session = req.getSession();
                req.setAttribute("oneQuestions",oneQuestions);
                req.setAttribute("userSql",userSql);

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


                req.getRequestDispatcher("WEB-INF/answer.jsp").forward(req,resp);
                return;
            }

            ArrayList<String> answerList=new ArrayList<String>();
            ArrayList<String> userAnswerList=new ArrayList<String>();


            rs=stmt.executeQuery(oneQuestions.getAnswer());
            rsmd= rs.getMetaData();
            count= rsmd.getColumnCount();
            while(rs.next()){
                for(int i=1;i<=count;i++) {
                    String column=rs.getString(i);
                    answerList.add(column);
                    System.out.print(column);
                }
                System.out.println();
            }

            rs=stmt.executeQuery(userSql);
            rsmd = rs.getMetaData();
            count = rsmd.getColumnCount();
            while(rs.next()){
                for(int i=1;i<=count;i++) {
                    String column=rs.getString(i);
                    userAnswerList.add(column);
                    System.out.print(column);
                }
                System.out.println();
            }
            boolean flag=true;
            int listLength1=answerList.size();
            int listLength2=userAnswerList.size();
            if(listLength1==listLength2){
                for (int i=0;i>=listLength1;i++){
                    if(!answerList.get(i).equals(userAnswerList.get(i))){
                        flag=false;
                    }
                }
            }else {
                flag=false;
            }

            if(flag){
                sql="insert into sqltest.order(uid,qid,time)values(?,?,?)";
                ps=conn.prepareStatement(sql);
                ps.setInt(1,new Integer(userId));
                ps.setInt(2,new Integer(oneQuestionId));
                ps.setInt(3,100);
                ps.executeUpdate();

                req.setAttribute("result","正确");
            }else {
                req.setAttribute("result","错误");
            }
            HttpSession session = req.getSession();
            req.setAttribute("oneQuestions",oneQuestions);
            req.setAttribute("userSql",userSql);


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
/**
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
