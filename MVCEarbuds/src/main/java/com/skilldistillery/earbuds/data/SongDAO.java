package com.skilldistillery.earbuds.data;

import com.skilldistillery.earbuds.entities.Song;

public interface SongDAO {

	public Song addSongToPlaylist(Integer id, String title, String album, String albumImage, String url,
			String artist);

	boolean removeSong(Integer id, Song song);

}
