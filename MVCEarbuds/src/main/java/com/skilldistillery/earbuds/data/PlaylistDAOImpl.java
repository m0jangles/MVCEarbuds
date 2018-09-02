package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class PlaylistDAOImpl implements PlaylistDAO {

	@PersistenceContext
	private EntityManager em;
	
	public List<Playlist> getPlaylistsByUser(User user){
		
		List<Playlist> playlists = user.getProfile().getPlaylists();
		
		return playlists;
		
	}

	
}
