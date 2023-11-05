package sqltest.service;

import sqltest.pojo.Order;

import java.util.List;

public interface IOrderService {

    Integer insertOrder(Order order);

    List<Order> selectAllOrder();
}
