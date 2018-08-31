package com.skilldistillery.earbuds.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user) {

		em.persist(user);

		em.flush();

		return user;

	}

	@Override
	public boolean destroyUser(User user) {
		User u = em.find(User.class, user.getId());
		em.remove(u);

		if (em.find(User.class, u.getId()) == null)
			return true;
		else
			return false;

	}

}
