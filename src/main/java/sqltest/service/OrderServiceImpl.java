package sqltest.service;

import sqltest.dao.IUserDao;
import sqltest.dao.UserDaoImpl;
import sqltest.pojo.Order;

import java.util.List;

public class OrderServiceImpl implements IOrderService{

    private IOrderService dao;

    public OrderServiceImpl() {
        dao=new OrderServiceImpl();
    }

    @Override
    public Integer insertOrder(Order order) {
        return dao.insertOrder(order);
    }

    @Override
    public List<Order> selectAllOrder() {
        return dao.selectAllOrder();
    }
}
