package com.skilldistillery.earbuds.test;

import static org.junit.jupiter.api.Assertions.*;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Song;

class GenreTest {

	private EntityManagerFactory emf;
	private EntityManager em;
	private Genre genre;

	@BeforeEach
	public void setUp() throws Exception {
		emf = Persistence.createEntityManagerFactory("earbuds");
		em = emf.createEntityManager();
		genre = em.find(Genre.class, 1);
	}

	@AfterEach
	public void tearDown() throws Exception {
		em.close();
		emf.close();
	}

	@Test
	void test_genre_mappings() {
		assertEquals("Country", genre.getName());
	}

	@Test
	void test_genre_to_song_association() {
		assertEquals("Hurt", genre.getSongs().get(0).getTitle());
	}

	@Test
	void test_genre_method_addSong_adds_song_to_song_list() {
		Song s = genre.getSongs().get(0);
		genre.addSong(s);
		assertTrue(genre.getSongs().contains(s));
	}

	@Test
	void test_genre_method_removeSong_removes_song_from_song_list() {
		Song s = genre.getSongs().get(0);
		genre.removeSong(s);
		assertFalse(genre.getSongs().contains(s));
	}
}
