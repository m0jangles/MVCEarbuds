package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Profile;

@Component
@Transactional
public class PlaylistDAOImpl implements PlaylistDAO {

	@PersistenceContext
	private EntityManager em;
	
	public List<Playlist> getPlaylists(Integer id){
		String query = "SELECT p from Profile p JOIN FETCH p.playlists WHERE p.id = :id";
		Profile result = em.createQuery(query, Profile.class).setParameter("id", id).getResultList().get(0);
		
		List<Playlist> playlists = result.getPlaylists();
		
		return playlists;
		
	}



	
}
