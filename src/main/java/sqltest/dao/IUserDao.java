package sqltest.dao;

import sqltest.pojo.User;

public interface IUserDao {

	User selectUserLogin(String num, String password);

	Integer insertUser(User user);

	User selectUserById(int id);

}
