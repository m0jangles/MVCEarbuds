package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

public interface PlaylistDAO {
	public List<Playlist> getPlaylists(Integer id);
	public List<Song> getSongs(Integer id);
	public Playlist createPlaylist(Integer id, String name);
	public boolean removePlaylist(Integer id);
	public Playlist getPlaylistById(Integer id);
	public List<Playlist> getPlaylistsByUserID(Integer userID);

}
