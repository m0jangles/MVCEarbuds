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
import com.skilldistillery.earbuds.entities.Song;

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
	
	@Test
	void test_playlist_mappings() {
		assertEquals("Songs to Sing in the Shower", playlist.getPlaylistName());
	}
	
	@Test
	void test_relationship_song() {
		assertEquals("Africa", playlist.getSongs().get(0).getTitle());
	
	}
	
	@Test
	void test_relationship_profile() {
		assertEquals("Jason", playlist.getProfile().getFirstName());
	
	}
	
	@Test
	void test_playlist_addSong_adds_song() {
		Song song = new Song();
		song.setTitle("Smoosh");
		playlist.addSong(song);
		assertTrue(playlist.getSongs().contains(song));
	}
	
	@Test
	void test_playlist_removeSong_removes_song() {
		Song song = em.find(Song.class, 1);
		playlist.removeSong(song);
		assertFalse(playlist.getSongs().contains(song));
	}
	

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	

}
