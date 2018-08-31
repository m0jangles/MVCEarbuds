package com.skilldistillery.earbuds.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToMany;
import javax.persistence.ManyToOne;

@Entity
public class Playlist {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column
	private String playlistName;
	
	@ManyToOne
	@JoinColumn(name="profile_id")
	private Profile profile;
	
	@Column(name="is_private")
	private int isPrivate;
	
	@ManyToMany(mappedBy="playlists")
	private List<Song> songs;
	
	//end fields
	
	public Playlist() {
		
	}
	
	public Profile getProfile() {
		return profile;
	}


	public void setProfile(Profile profile) {
		this.profile = profile;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getPlaylistName() {
		return playlistName;
	}

	public void setPlaylistName(String playlistName) {
		this.playlistName = playlistName;
	}


	public int getIsPrivate() {
		return isPrivate;
	}

	public void setIsPrivate(int isPrivate) {
		this.isPrivate = isPrivate;
	}

	@Override
	public String toString() {
		return "Playlist [id=" + id + ", playlistName=" + playlistName + ", isPrivate=" + isPrivate + "]";
	}
	
	public void addSong(Song song) {
		if (songs == null)
			songs = new ArrayList<>();
		if (!songs.contains(song)) {
			songs.add(song);
			song.addPlaylist(this);
		}
	}

	public void removeSong(Song song) {
		if (songs != null && songs.contains(song)) {
			songs.remove(song);
			song.removePlaylist(this);
		}

	}
	
	
}
