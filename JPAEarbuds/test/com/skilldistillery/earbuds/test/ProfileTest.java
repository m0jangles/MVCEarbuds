package com.skilldistillery.earbuds.test;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Profile;

class ProfileTest {
	private EntityManagerFactory emf;
	private EntityManager em;
	private Profile profile;
	
	
	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		profile = em.find(Profile.class, 1);
		
	}
	
	@Test
	void test_relationship_user() {
		
	
	}
	@Test
	void test_relationship_location() {
		
	
	}
	

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	

}
