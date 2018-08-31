package com.skilldistillery.earbuds.test;

import static org.junit.Assert.assertNotEquals;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.User;

class UserTest {
	EntityManagerFactory emf;
	EntityManager em;
	User u;
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		u = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_user_mappings() {
		assertEquals("DRodman", u.getUsername());
		assertEquals("password", u.getPassword());
		assertEquals("DRodman@aol.com", u.getEmail());
	}
	@Test
	void test_user_to_profile_mappings() {
		assertEquals("Dennis", u.getProfile().getFirstName());
		assertEquals("Rodman", u.getProfile().getLastName());
	}
	@Test
	void test_user_to_friends_mappings() {
		// This test will change to assertNotEquals once we are ready to attempt implementing friends
		assertEquals(0, u.getFriends().size());
//		assertNotEquals(0, u.getFriends().size());
	}
	@Test
	void test_user_addFriends_adds_friends_to_both() {
		// Find another user
		User f = em.find(User.class, 2);
		// add that second user to first user's friend list
		u.addFriend(f);
		// test that user f is now in user u's list
		assertTrue(u.getFriends().contains(f));
		// test that user u is now in user f's list
		assertTrue(f.getFriends().contains(u));
	}
	@Test
	void test_user_removeFriends_removes_friends_from_both() {
		User f = em.find(User.class, 2);
		u.removeFriend(f);
		assertFalse(u.getFriends().contains(f));
		assertFalse(f.getFriends().contains(u));
	}
 
}
