package com.skilldistillery.earbuds.data;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class ProfileDAOImpl implements ProfileDAO {
	@PersistenceContext
	private EntityManager em;
	private Profile userProfile;
	private String query;

	@Override
	public Profile getInfo(User user) {
		userProfile.setFirstName(user.getProfile().getFirstName());
		userProfile.setLastName(user.getProfile().getLastName());
		userProfile.setImage(user.getProfile().getImage());
		userProfile.setLocation(user.getProfile().getLocation());
		userProfile.setPlaylists(user.getProfile().getPlaylists());
		return userProfile;
	}

	@Override
	public boolean updateInfo(User user) {
		Profile profile = user.getProfile();
		query = "UPDATE ";
		
		em.persist(profile);
		em.flush();
		
		return false;
	}
	
	
}
