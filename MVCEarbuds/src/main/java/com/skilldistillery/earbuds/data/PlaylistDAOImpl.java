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
		String query = "SELECT p from Playlist p JOIN FETCH p.profile WHERE p.profile.id = :id";
		List<Playlist> playlists = em.createQuery(query, Playlist.class).setParameter("id", id).getResultList();

		return playlists;

	}

	public List<Song> getSongs(Integer id) {
		String query = "SELECT p from Playlist p JOIN FETCH p.songs WHERE p.id = :id";
		Playlist result = em.createQuery(query, Playlist.class).setParameter("id", id).getResultList().get(0);

		List<Song> songs = result.getSongs();

		return songs;

	}

	@Override
	public Playlist createPlaylist(Integer id, String name) {
		Profile profile = em.find(Profile.class, id);
		Playlist newPlaylist = new Playlist();
		newPlaylist.setPlaylistName(name);
		newPlaylist.setProfile(profile);
		em.persist(newPlaylist);
		em.flush();
		return newPlaylist;
	}

	@Override
	public boolean removePlaylist(Integer id) {
		Playlist playlist = em.find(Playlist.class, id);
		em.remove(playlist);
		if (em.find(Playlist.class, id) == null) {
			return true;
		} else {
			return false;
		}
	}

}
