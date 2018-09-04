package com.skilldistillery.earbuds.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class SongDAOImpl {
	
	@PersistenceContext
	private EntityManager em;
	
	public Song addSongToPlaylist(Integer id, Song song, String title, String album, String url, String artist) {
		Playlist playlist = em.find(Playlist.class, id);
		playlist.addSong(song);
		song.setTitle(title);
		
		return song;
		
	}
	

}
