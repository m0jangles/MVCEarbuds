package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.User;

public interface PlaylistDAO {
	public List<Playlist> getPlaylistsByUser(User user);
	

}
