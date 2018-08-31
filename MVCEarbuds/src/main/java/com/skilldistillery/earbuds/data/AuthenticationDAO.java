package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.User;

public interface AuthenticationDAO {

	public User getUserByUserNameAndPassword(String userName, String password);

	public User findUserById(int userId);

	public List<User> getAllUsers();

}
