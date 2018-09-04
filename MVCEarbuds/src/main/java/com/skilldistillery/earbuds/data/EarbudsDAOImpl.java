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
			query = "Select p FROM Profile p";
			List<Profile> results = em.createQuery(query, Profile.class).getResultList();
			return results;
		} else {
			query = "SELECT u.profile FROM User u "
					+ " WHERE u.username LIKE :search"
					+ " OR u.email LIKE :search " 
					+ " OR u.profile.firstName LIKE :search " 
					+ " OR u.profile.lastName LIKE :search";
			List<Profile> results = em.createQuery(query, Profile.class)
					.setParameter("search", "%" + searchInput + "%").getResultList();
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
			query = "SELECT s FROM Song s WHERE s.title LIKE :search" 
					+ " OR s.artist LIKE :search"
					+ " OR s.album LIKE :search";
			List<Song> results = em.createQuery(query, Song.class)
					.setParameter("search", "%" + searchInput + "%").getResultList();
			return results;
		}
	}

}
