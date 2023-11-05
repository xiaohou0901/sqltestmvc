package sqltest.dao;

import sqltest.pojo.Order;
import sqltest.pojo.User;
import sqltest.util.JDBCUtils;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;


public class OrderDaoImpl implements IOrderDao {
	private Connection conn;
	private Statement stmt;
	private PreparedStatement ps;
	private ResultSet rs;



	@Override
	public Integer insertOrder(Order order) {
		Integer id=null;
		try {
			conn=JDBCUtils.getConnection();
			String sql="insert into order (uid,qid,time) value(?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,order.getUid());
			ps.setInt(2,order.getQid());
			ps.setInt(3,order.getTime());
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
	public List<Order> selectAllOrder() {
		List<Order> list=new ArrayList<>();

		try {
			conn=JDBCUtils.getConnection();
			String sql="select * from order ";
			ResultSet rs = stmt.executeQuery(sql);
			while(rs.next()) {
				Order order=new Order();
				order.setQid(rs.getInt("qid"));
				order.setUid(rs.getInt("uid"));
				order.setTime(rs.getInt("time"));
				list.add(order);
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
		return list;
	}
}
