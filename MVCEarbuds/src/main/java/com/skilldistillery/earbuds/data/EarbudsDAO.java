package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;

public interface EarbudsDAO {
	
	public List<Profile> searchForUsers(String searchInput);
	public List<Song> searchForSongs(String searchInput);
}
