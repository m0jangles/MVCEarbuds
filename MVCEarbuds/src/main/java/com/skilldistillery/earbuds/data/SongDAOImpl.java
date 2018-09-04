package com.skilldistillery.earbuds.data;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class SongDAOImpl implements SongDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	public Song addSongToPlaylist(Integer id, String title, String album, String albumImage, String url, String artist) {
		Playlist playlist = em.find(Playlist.class, id);
		Song song = new Song();
		playlist.addSong(song);
		song.setTitle(title);
		song.setAlbum(album);
		song.setAlbumImage(albumImage);
		song.setUrl(url);
		song.setArtist(artist);
		
		em.persist(playlist);
		em.persist(song);
		em.flush();
		
		return song;
		
	}
	
}
