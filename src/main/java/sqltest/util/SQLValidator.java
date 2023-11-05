package sqltest.util;

import java.sql.*;

public class SQLValidator {

    public static boolean validateSQL(String sql) {
        try {
            String url="jdbc:mysql://127.0.0.1:3306/sqltest";
            String username="root";
            String pwd="123456";
            Connection conn=DriverManager.getConnection(url,username,pwd);
            Statement stmt = conn.createStatement();
            stmt.execute(sql);
            return true;
        } catch (SQLException e) {
            return false;
        }
    }



}
 