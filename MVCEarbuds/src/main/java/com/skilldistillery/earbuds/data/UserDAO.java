package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

public interface UserDAO {

	public User createUser(User user, String firstname, String lastname);

	public boolean destroyUser(Integer userToDeleteID);

	public boolean addNewFriend(User userInSession, Integer friendId);
	
	public boolean deleteFriend(User userInSession, Integer friendId);
	
	public List<User> getUserInSessionFriendsList (Integer id);
	
	public Profile getUserProfileById(Integer id);

}
