package com.skilldistillery.earbuds.data;

import com.skilldistillery.earbuds.entities.User;

public interface UserDAO {

	public User createUser(User user, String firstname, String lastname);

	boolean destroyUser(User user);
	

}
