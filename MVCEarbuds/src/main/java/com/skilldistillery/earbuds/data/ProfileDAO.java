package com.skilldistillery.earbuds.data;
		
import com.skilldistillery.earbuds.entities.Profile;

public interface ProfileDAO {
	Profile getInfo();
	boolean updateInfo();


}
