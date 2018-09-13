package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;
import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class PlaylistDAOImpl implements PlaylistDAO {

	@PersistenceContext
	private EntityManager em;
	String query;

	public List<Playlist> getPlaylists(Integer id) {
		query = "SELECT p from Playlist p JOIN FETCH p.profile WHERE p.profile.id = :id";
		List<Playlist> playlists = em.createQuery(query, Playlist.class)
				.setParameter("id", id).getResultList();

		return playlists;

	}

	public List<Song> getSongs(Integer id) {
		query = "SELECT p from Playlist p JOIN FETCH p.songs WHERE p.id = :id";
		List<Playlist> result = em.createQuery(query, Playlist.class)
				.setParameter("id", id).getResultList();

		if (result.size() > 0) {
			List<Song> songs = result.get(0).getSongs();
			return songs;
		} else {
			return null;
		}
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
		List<Song> songs = playlist.getSongs();
		em.remove(playlist);
		if (em.find(Playlist.class, id) == null) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public Playlist getPlaylistById(Integer id) {
		Playlist playlist = em.find(Playlist.class, id);
		return playlist;
	}

	@Override
	public List<Playlist> getPlaylistsByUserID(Integer userID) {
		User user = em.find(User.class, userID);
		Profile profile = user.getProfile();
		query = "SELECT p from Playlist p WHERE p.profile.id = :id";
		List<Playlist> playlists = em.createQuery(query, Playlist.class)
				.setParameter("id", profile.getId()).getResultList();
		if (!playlists.isEmpty()) {
			return playlists;
		}
		else {
			return null;
		}
	}

}
