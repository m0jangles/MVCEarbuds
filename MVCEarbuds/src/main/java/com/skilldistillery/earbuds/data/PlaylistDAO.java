package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

public interface PlaylistDAO {
	public List<Playlist> getPlaylists(Integer id);
	public List<Song> getSongs(Integer id);

}
