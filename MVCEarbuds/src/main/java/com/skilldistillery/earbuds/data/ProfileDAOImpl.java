package com.skilldistillery.earbuds.data;


import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Profile;

@Component
@Transactional
public class ProfileDAOImpl implements ProfileDAO {
	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public Profile updateInfo(Profile profile) {
		Profile managedProfile = em.find(Profile.class, profile.getId());
		managedProfile.setFirstName(profile.getFirstName());
		managedProfile.setLastName(profile.getLastName());
		managedProfile.setLocation(profile.getLocation());
		managedProfile.setImage(profile.getImage());
		return managedProfile;
	}
	
	
}
