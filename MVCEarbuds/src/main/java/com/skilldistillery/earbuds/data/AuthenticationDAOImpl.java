package com.skilldistillery.earbuds.data;

import java.util.List;
import java.util.Set;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class AuthenticationDAOImpl implements AuthenticationDAO {
	@PersistenceContext
	private EntityManager em;
	

	@Override
	public List<User> getAllUsers() {
		String query = "SELECT u FROM User u";
		List<User> users = em.createQuery(query, User.class).getResultList();
		
		return users;
		
	}
	@Override
	public User getUserByUserNameAndPassword(String username, String password) {
		
		User u = null;
		List<User> users = getAllUsers();
		
		for (User user : users) {
			if (user.getUsername().equals(username) && user.getPassword().equals(password)) {
				u = user;
				break;
			}
		}
		return u;
	}
	
	@Override
	  public User findUserById(int userId) {
		List<User> users = getAllUsers();
	    User u = users.get(userId);
	    
	    return u;
	  }
	
}
