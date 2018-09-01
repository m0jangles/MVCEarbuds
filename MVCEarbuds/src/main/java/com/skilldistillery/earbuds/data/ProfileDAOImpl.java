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
	private String query;

	@Override
	public boolean updateInfo(User user) {
		Profile profile = user.getProfile();
		query = "UPDATE ";
		
		em.persist(profile);
		em.flush();
		
		return false;
	}
	
	
}
