package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Genre;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

@Component
@Transactional
public class SongDAOImpl implements SongDAO {

	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public Song addSongToPlaylist(Song songWithChanges, Integer playlistId,
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

		return null;
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

}
