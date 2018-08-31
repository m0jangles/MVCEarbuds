package com.skilldistillery.earbuds.test;

import static org.junit.jupiter.api.Assertions.assertEquals;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Playlist;

class PlaylistTest {
	
	private EntityManagerFactory emf;
	private EntityManager em;
	private Playlist playlist;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		playlist = em.find(Playlist.class, 1);
	}
	
//	@Test
//	void test_relationship_song() {
//		assertEquals("", playlist.getSongs().get(0).getTitle());
//	
//	}
//	
//	@Test
//	void test_relationship_profile() {
//		assertEquals()
//	
//	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	

}
