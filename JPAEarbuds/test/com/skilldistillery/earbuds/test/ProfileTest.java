package com.skilldistillery.earbuds.test;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertFalse;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Playlist;
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
	
	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}
	
	@Test
	void test_mappings() {
		assertEquals("Dennis", profile.getFirstName());
		assertEquals("Rodman", profile.getLastName());
		
	}
	@Test
	void test_relationship_user() {
		assertEquals("DRodman", profile.getUser().getUsername());
	
	}
	@Test
	void test_relationship_location() {
		assertEquals("Chicago", profile.getLocation().getCity());
		
	
	}
	
	@Test
	void test_relationship_playlist() {
		Profile profile2 = em.find(Profile.class, 2);
		assertEquals("Songs to Sing in the Shower", profile2.getPlaylists().get(0).getPlaylistName());
	}
	
	 @Test
	    void test_profile_addPlaylist_adds_playlist() {
		 	Playlist playlist = new Playlist();
		 	playlist.setPlaylistName("Gym");
		 	profile.addPlaylist(playlist);
	        assertTrue(profile.getPlaylists().contains(playlist));
	    }

	    @Test
	    void test_profile_removePlaylist_removes_playlist() {
	    	Playlist playlist = em.find(Playlist.class, 1);
	    	profile.removePlaylist(playlist);
	    	assertFalse(profile.getPlaylists().contains(playlist));
	    	     
	    }
	


	

}
