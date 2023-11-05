package sqltest.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class JDBCUtils {
	//加载驱动
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	private static Connection conn=null;
	//获取Connection对象
	public static Connection getConnection() throws SQLException {
		String url="jdbc:mysql://127.0.0.1:3306/sqltest";
		String user="root";
		String password="123456";
		if (conn==null||conn.isClosed()) {
			conn = DriverManager.getConnection(url, user, password);
		}
		return conn;
	}
	//关闭资源
	public static void close(Connection conn,Statement stmt,ResultSet rs) throws SQLException {
	
		if(conn!=null&& !conn.isClosed()) {
			conn.close();
		}
		if(stmt!=null&& !stmt.isClosed()) {
			stmt.close();
		}
		if(rs!=null&& !rs.isClosed()) {
			rs.close();
		}
	
	}
}
