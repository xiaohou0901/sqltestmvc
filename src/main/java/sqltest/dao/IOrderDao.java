package sqltest.dao;

import sqltest.pojo.Order;
import sqltest.pojo.User;

import java.util.List;

public interface IOrderDao {

	Integer insertOrder(Order order);

	List<Order> selectAllOrder();

}
