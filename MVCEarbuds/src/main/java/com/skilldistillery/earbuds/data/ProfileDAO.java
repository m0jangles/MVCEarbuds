package com.skilldistillery.earbuds.data;
		
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

public interface ProfileDAO {
	Profile getInfo(User user);
	boolean updateInfo(User user);


}
