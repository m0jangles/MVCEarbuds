package com.skilldistillery.earbuds.data;

import java.util.List;

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

	// User adds friend to their friend's list - in the future we should just pass
	// in the userInSession's ID, not the whole object
	@Override
	public boolean addNewFriend(User userInSession, Integer friendId) {

		User userToBeFriended = em.find(User.class, friendId);

		// If join fetch fails, entire thing fails, returns null - Join fetch gets
		// around the lazily loading exception
		String query = "SELECT u FROM User u JOIN FETCH u.friends WHERE u.id = :id";

		List<User> result = em.createQuery(query, User.class)
				.setParameter("id", userInSession.getId()).getResultList();

		User currentUser = new User();

		if (result.size() > 0) {
			currentUser = result.get(0);
			currentUser.addFriend(userToBeFriended);
		} else {
			// Contingency plan for first friend or if user has no friends
			currentUser = em.find(User.class, userInSession.getId());
			currentUser.addFriend(userToBeFriended);
		}

		if (currentUser.getFriends().contains(userToBeFriended)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean deleteFriend(User userInSession, Integer friendId) {
		User notMyFriendAnymore = em.find(User.class, friendId);
		userInSession.removeFriend(notMyFriendAnymore);
		if (!userInSession.getFriends().contains(notMyFriendAnymore)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public List<User> getFriendsList(User id) {
		User currentUser = em.find(User.class, id);
		List<User> friendsList = currentUser.getFriends();
		return friendsList;
	}

	@Override
	public Profile getUserProfileById(Integer id) {
		User profileOwner = em.find(User.class, id);
		Profile userProfile = profileOwner.getProfile();
		return userProfile;
	}

}
