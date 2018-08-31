package com.skilldistillery.earbuds.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Location;
import com.skilldistillery.earbuds.entities.Profile;

class LocationTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Location location;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		location = em.find(Location.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_location_mappings() {
		assertEquals("Chicago", location.getCity());
		assertEquals("Illinois", location.getState());
		assertEquals("United States", location.getCountry());
	}

	@Test
	void test_location_to_profile_association() {
		assertEquals("Dennis", location.getProfiles().get(0).getFirstName());
	}

	@Test
	void test_location_method_addProfile_adds_profile_to_profile_list() {
		Profile p = location.getProfiles().get(0);
		location.addProfile(p);
		assertTrue(location.getProfiles().contains(p));
	}

	@Test
	void test_location_method_removeProfile_removes_profile_from_profile_list() {
		Profile p = location.getProfiles().get(0);
		location.removeProfile(p);
		assertFalse(location.getProfiles().contains(p));
	}

}
