package com.skilldistillery.earbuds.test;

import static org.junit.Assert.assertNotEquals;
import static org.junit.Assert.assertThat;
import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertNotNull;
import static org.junit.jupiter.api.Assertions.assertTrue;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Song;

class SongTest {
	EntityManagerFactory emf;
	EntityManager em;
	Song s;

	@BeforeEach
	void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		s = em.find(Song.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_Song_Mappings() {
		assertEquals("Africa", s.getTitle());
		assertEquals("Toto", s.getArtist());
	}
	
	@Test
	void test_song_to_playlist_mappings() {
		assertNotNull(s.getPlaylists());
		assertNotEquals(0, s.getPlaylists().size());
		assertEquals("Songs to Sing in the Shower", s.getPlaylists().get(0).getPlaylistName());
	}
	
	@Test
	void test_song_to_genres_mappings() {
		assertNotNull(s.getPlaylists());
		assertNotEquals(0, s.getGenres().size());
		assertEquals("Rock", s.getGenres().get(0).getName());
	}
	
	@Test
	void test_song_add_genre_adds_genre() {
		Genre g = em.find(Genre.class, 1);
		s.addGenre(g);
		assertTrue(s.getGenres().contains(g));
	}

}
