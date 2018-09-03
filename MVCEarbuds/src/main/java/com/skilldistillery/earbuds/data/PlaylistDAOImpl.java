package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class PlaylistDAOImpl implements PlaylistDAO {

	@PersistenceContext
	private EntityManager em;

	public List<Playlist> getPlaylists(Integer id) {
		String query = "SELECT p from Profile p JOIN FETCH p.playlists WHERE p.id = :id";
		Profile result = em.createQuery(query, Profile.class).setParameter("id", id).getResultList().get(0);

		List<Playlist> playlists = result.getPlaylists();

		return playlists;

	}
	
	public List<Song> getSongs(Integer id) {
		String query = "SELECT p from Playlist p JOIN FETCH p.songs WHERE p.id = :id";
		Playlist result = em.createQuery(query, Playlist.class).setParameter("id", id).getResultList().get(0);

		List<Song> songs = result.getSongs();
		
		return songs;

	}


}
