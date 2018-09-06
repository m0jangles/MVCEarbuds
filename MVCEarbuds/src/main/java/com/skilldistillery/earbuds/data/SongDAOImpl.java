package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.PostDTO;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class SongDAOImpl implements SongDAO {

	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public boolean addSongToPlaylist(Song songWithChanges, Integer playlistId,
			String genre) {

		Playlist playlistToUpdate = em.find(Playlist.class, playlistId);

		String songWithChangesTitle = songWithChanges.getTitle();
		String songWithChangesArtist = songWithChanges.getArtist();
		String songWithChangesAlbum = songWithChanges.getAlbum();

		query = "SELECT s FROM Song s WHERE s.title = :title "
				+ "AND s.artist = :artist AND s.album = :album";

		List<Song> result1 = em.createQuery(query, Song.class)
				.setParameter("title", songWithChangesTitle)
				.setParameter("artist", songWithChangesArtist)
				.setParameter("album", songWithChangesAlbum).getResultList();

		// Check if song exists already in the database. If so, just set the
		// playlist to add that song. Otherwise, persist the song and then add it to
		// the playlist.
		if (result1.size() > 0) {
			playlistToUpdate.addSong(result1.get(0));
		}
		// If the song does not already exist, and the user provides a genre for the
		// song, find the genre in the database and assign it to the song.
		else {
			String newUrl = SongDAO.findYoutube11(songWithChanges.getUrl());
			songWithChanges.setUrl(newUrl);
			em.persist(songWithChanges);
			em.flush();

			query = "SELECT g FROM Genre g WHERE g.name = :genre";

			List<Genre> result2 = em.createQuery(query, Genre.class)
					.setParameter("genre", genre).getResultList();

			if (result2.size() > 0) {
				Genre g = result2.get(0);
				g.addSong(songWithChanges);

			}

			playlistToUpdate.addSong(songWithChanges);

		}

		if (result1.size() > 0
				|| em.find(Song.class, songWithChanges.getId()) != null) {
			return true;
		} else {
			return false;
		}

	}

	@Override
	public boolean addSongToPlaylistFromSearchPage(int playlistID, int songID) {

		Playlist playlistToUpdate = em.find(Playlist.class, playlistID);
		Song songToAddToPlaylist = em.find(Song.class, songID);

		playlistToUpdate.addSong(songToAddToPlaylist);

		if (playlistToUpdate.getSongs().contains(songToAddToPlaylist)) {
			return true;
		} else {
			return false;
		}
	}

	@Override
	public boolean removeSong(Integer id, Integer songId) {
		Playlist playlist = em.find(Playlist.class, id);
		Song song = em.find(Song.class, songId);
		playlist.removeSong(song);
		if (!playlist.getSongs().contains(song)) {
			return true;
		} else {
			return false;
		}
	}
	
	public Post postSong(Integer id, String message, Integer songId) {
		Profile profile = em.find(Profile.class, id);
		Song song = em.find(Song.class, songId);
		Post post = new Post();
		post.setProfile(profile);
		post.setMessage(message);
		post.setSong(song);

		em.persist(post);
		em.flush();

		return post;

	}

	@Override
	public void addSongtoPost(PostDTO postDTO, Integer profileID) {
		Profile p =  em.find(Profile.class, profileID);
		Song s = new Song();
		s.setTitle(postDTO.getTitle());
		s.setArtist(postDTO.getArtist());
		s.setAlbum(postDTO.getAlbum());
		s.setAlbumImage(postDTO.getAlbumImage());
		s.setUrl(SongDAO.findYoutube11(postDTO.getUrl()));
		
		query = "SELECT g FROM Genre g WHERE g.name = :genre";

		List<Genre> result = em.createQuery(query, Genre.class)
				.setParameter("genre", postDTO.getGenre()).getResultList();
		s.addGenre(result.get(0));
		Post post = new Post();
		post.setProfile(p);
		post.setSong(s);
		post.setMessage(postDTO.getMessage());
		
		em.persist(post);
		em.flush();
		

	}
	
	
//	public boolean addSongtoPost(Song songWithChanges, Integer profileId,
//			String genre, String message) {
//		Profile profile = em.find(Profile.class, profileId);
//		Post post = new Post();
//
//		String songWithChangesTitle = songWithChanges.getTitle();
//		String songWithChangesArtist = songWithChanges.getArtist();
//		String songWithChangesAlbum = songWithChanges.getAlbum();
//
//		query = "SELECT s FROM Song s WHERE s.title = :title "
//				+ "AND s.artist = :artist AND s.album = :album";
//
//		List<Song> result1 = em.createQuery(query, Song.class)
//				.setParameter("title", songWithChangesTitle)
//				.setParameter("artist", songWithChangesArtist)
//				.setParameter("album", songWithChangesAlbum).getResultList();
//
//		// Check if song exists already in the database. If so, just set the
//		// playlist to add that song. Otherwise, persist the song and then add it to
//		// the playlist.
//		if (result1.size() > 0) {
//			post.setProfile(profile);
//			post.setMessage(message);
//			post.setSong(songWithChanges);
////			playlistToUpdate.addSong(result1.get(0));
//		}
//		// If the song does not already exist, and the user provides a genre for the
//		// song, find the genre in the database and assign it to the song.
//		else {
//			String newUrl = SongDAO.findYoutube11(songWithChanges.getUrl());
//			songWithChanges.setUrl(newUrl);
//			em.persist(songWithChanges);
//			em.flush();
//
//			query = "SELECT g FROM Genre g WHERE g.name = :genre";
//
//			List<Genre> result2 = em.createQuery(query, Genre.class)
//					.setParameter("genre", genre).getResultList();
//
//			if (result2.size() > 0) {
//				Genre g = result2.get(0);
//				g.addSong(songWithChanges);
//
//			}
//
//			post.setProfile(profile);
//			post.setMessage(message);
//			post.setSong(songWithChanges);
//			em.persist(post);
//			em.flush();
//
//		}
//
//		if (result1.size() > 0
//				|| em.find(Song.class, songWithChanges.getId()) != null) {
//			return true;
//		} else {
//			return false;
//		}

	}


