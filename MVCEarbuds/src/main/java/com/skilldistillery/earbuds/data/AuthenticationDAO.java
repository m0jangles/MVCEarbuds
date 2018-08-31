package com.skilldistillery.earbuds.data;

import com.skilldistillery.earbuds.entities.User;

public interface AuthenticationDAO {

	public User getUserByUserNameAndPassword(String userName, String password);

	public User createUser(User user);

	public User findUserById(int userId);

	public boolean destroyUser(User user);

}
