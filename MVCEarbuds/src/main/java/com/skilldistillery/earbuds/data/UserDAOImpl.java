package com.skilldistillery.earbuds.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Location;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class UserDAOImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public User createUser(User user, String firstname, String lastname) {
		Profile newProfile = new Profile();
		Location l = em.find(Location.class, 1);
		newProfile.setFirstName(firstname);
		newProfile.setLastName(lastname);
		newProfile.setUser(user);
		newProfile.setLocation(l);
		em.persist(newProfile);
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
	
	// User a friend to their friends list
	@Override
	public boolean addNewFriend(User userInSession, Integer friendId) {
		User userToBeFriended = em.find(User.class, friendId);
		userInSession.addFriend(userToBeFriended);
		em.persist(userInSession);
		em.flush();
		if (userInSession.getFriends().contains(userToBeFriended)) {
			return true;
		} else {
			return false;
		}
	}

}
