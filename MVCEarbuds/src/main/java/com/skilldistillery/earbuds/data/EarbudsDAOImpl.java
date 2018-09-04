package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class EarbudsDAOImpl implements EarbudsDAO {

	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public List<Profile> searchForUsers(String searchInput) {
		if (searchInput.isEmpty()) {
			query = "Select p.firstName, p.lastName, p.image FROM Profile p";
			List<Profile> results = em.createQuery(query, Profile.class).getResultList();
			return results;
		} else {
			query = "SELECT p.firstName, p.lastName, p.image FROM Profile p WHERE p.user.username = :search"
					+ " OR p.user.email = :search " + " OR p.firstName = :search " + " OR p.lastName = :search";
			List<Profile> results = em.createQuery(query, Profile.class).setParameter("search", searchInput)
					.getResultList();
			return results;
		}
	}

	@Override
	public List<Song> searchForSongs(String searchInput) {
		if (searchInput.isEmpty()) {
			query = "SELECT s FROM Song s";
			List<Song> results = em.createQuery(query, Song.class).getResultList();
			return results;
		} else {
			query = "SELECT s FROM Song s WHERE s.title = :search" + " OR s.artist = :search"
					+ " OR s.alblum = :search";
			List<Song> results = em.createQuery(query, Song.class).setParameter("search", searchInput).getResultList();
			return results;
		}
	}

}
