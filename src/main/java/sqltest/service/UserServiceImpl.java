package sqltest.service;

import sqltest.dao.IUserDao;
import sqltest.dao.UserDaoImpl;
import sqltest.pojo.User;

public class UserServiceImpl implements IUserService {
	private IUserDao dao;
	public UserServiceImpl() {
		dao=new UserDaoImpl();
	}

	@Override
	public User checkUser(String num, String password) {
		return dao.selectUserLogin(num,password);
	}

	@Override
	public Integer saveUser(User user) {
		return dao.insertUser(user);
	}

	@Override
	public User selectUserById(int id) {
		return dao.selectUserById(id);
	}


}
