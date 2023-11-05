package sqltest.service;

import sqltest.pojo.User;

public interface IUserService {
	//对用户进行验证
	User checkUser(String num, String password);

	Integer saveUser(User user);

	User selectUserById(int id);


}
