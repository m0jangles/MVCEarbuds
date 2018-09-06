package com.skilldistillery.earbuds.data;

import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.Song;

public interface SongDAO {

//	public Song addSongToPlaylist(Integer id, String title, String album, String albumImage, String url,
//			String artist);

	public boolean addSongToPlaylist(Song songWithChanges, Integer playlistId,
			String genre);
	public Post postSong(Integer id, String message, Integer songId);

	boolean removeSong(Integer id, Integer songId);

	// Paul is a genius!
	public static String findYoutube11(String url) {
		if (!url.contains("http://youtu.be/") && !url.contains("https://youtu.be/")
				&& !url.contains("http://www.youtube.com/")
				&& !url.contains("https://www.youtube.com/")) {
			return "OCmuATH2yzo"; // Homer - DOH !
		}

		int pos = url.indexOf("watch?v=");
		if (pos >= 0)
			return url.substring(pos + 8, pos + 19);

		pos = url.indexOf("/v/");
		if (pos >= 0)
			return url.substring(pos + 3, pos + 14);

		pos = url.indexOf("?v=");
		if (pos >= 0)
			return url.substring(pos + 3, pos + 14);

		if (url.length() >= 11)
			return url.substring(url.length() - 11);

		return "OCmuATH2yzo"; // Homer - DOH !
	}
	// Paul is a genius!
	
	public boolean addSongToPlaylistFromSearchPage(int playlistID, int songID);

}
