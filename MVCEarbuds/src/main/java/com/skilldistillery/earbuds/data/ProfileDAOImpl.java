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

	@Override
	public Profile getInfo() {
		return null;
	}

	@Override
	public boolean updateInfo() {
		return false;
	}
	
	
}
