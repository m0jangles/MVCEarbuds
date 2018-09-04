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

	public Song addSongToPlaylist(Integer id, String title, String album, String albumImage, String url,
			String artist) {
		Playlist playlist = em.find(Playlist.class, id);
		Song song = new Song();
		song.setTitle(title);
		song.setAlbum(album);
		song.setAlbumImage(albumImage);
		song.setUrl(url);
		song.setArtist(artist);
		playlist.addSong(song);
		
		em.flush();

		return song;

	}
	
	@Override
	public boolean removeSong(Integer id, Integer songId) {
		Playlist playlist = em.find(Playlist.class, id);
		System.out.println("*************** " +songId);
		Song song = em.find(Song.class, songId);
		playlist.removeSong(song);
		if (!playlist.getSongs().contains(song)) {
			return true;
		} else {
			return false;
		}
	}



}
