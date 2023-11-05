package sqltest.dao;

import sqltest.pojo.User;
import sqltest.util.JDBCUtils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;


public class UserDaoImpl implements IUserDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement ps;
	private ResultSet rs;
	@Override
	public User selectUserLogin(String num, String password) {
		User user = null;
		try {
			conn= JDBCUtils.getConnection();
			String sql="select * from user where num=? and password=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, num);
			ps.setString(2, password);
			rs=ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setNum(rs.getString("num"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
				}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				JDBCUtils.close(conn, stmt, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return user;
	}
	@Override
	public Integer insertUser(User user) {
		Integer id=null;
		try {
			conn=JDBCUtils.getConnection();
			String sql="insert into user(name,num,password,role) value(?,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1,user.getName());
			ps.setString(2,user.getNum());
			ps.setString(3,user.getPassword());
			ps.setString(4,user.getRole());
			ps.executeUpdate();
			//sql="select last_insert_id() newId";
			sql="select @@identity newId";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			if(rs.next()) {
				id=rs.getInt("newId");
			}
			} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				JDBCUtils.close(conn, stmt, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		return id;
		
	}

	@Override
	public User selectUserById(int id) {
		User user = new User();
		try {
			conn=JDBCUtils.getConnection();
			String sql="select * from user where id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,id);
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				user=new User();
				user.setId(rs.getInt("id"));
				user.setName(rs.getString("name"));
				user.setNum(rs.getString("num"));
				user.setPassword(rs.getString("password"));
				user.setRole(rs.getString("role"));
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				JDBCUtils.close(conn, stmt, rs);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		}
		return user;

	}
}
