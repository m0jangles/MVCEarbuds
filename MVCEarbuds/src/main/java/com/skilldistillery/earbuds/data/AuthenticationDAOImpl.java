package com.skilldistillery.earbuds.data;

import java.util.Map;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class AuthenticationDAOImpl implements AuthenticationDAO {
	private EntityManager em;
	
	private Map<Integer, User> users;

	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		User u = null;
		Set<Integer> keys = users.keySet();
		for (Integer key : keys) {
			User user = users.get(key);
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}
	
	@Override
	  public User findUserById(int userId) {
	    User u = users.get(userId);
	    
	    return u;
	  }
	
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
		
		if(em.find(User.class, u.getId()) == null)
			return true;
		else
			return false;	
			
	}

}
