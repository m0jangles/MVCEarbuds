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
	public Profile updateInfo(Profile profileWithChanges, int id, String city,
			String state, String country) {

		Profile managedProfile = em.find(Profile.class, id);

		managedProfile.setFirstName(profileWithChanges.getFirstName());
		managedProfile.setLastName(profileWithChanges.getLastName());
		managedProfile.setImage(profileWithChanges.getImage());
		managedProfile.getLocation().setCity(city);
		managedProfile.getLocation().setState(state);
		managedProfile.getLocation().setCountry(country);

		return managedProfile;
	}

}
