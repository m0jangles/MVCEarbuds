package com.skilldistillery.earbuds.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
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

	// fields

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "name")
	private String playlistName;

	@ManyToOne(cascade = {CascadeType.PERSIST})
	@JoinColumn(name = "profile_id")
	private Profile profile;

	@Column(name = "is_private")
	private int isPrivate;

	@ManyToMany(mappedBy = "playlists", cascade = CascadeType.PERSIST)
	private List<Song> songs;

	// constructors

	public Playlist() {

	}

	public Playlist(int id, String playlistName, Profile profile, int isPrivate,
			List<Song> songs) {
		super();
		this.id = id;
		this.playlistName = playlistName;
		this.profile = profile;
		this.isPrivate = isPrivate;
		this.songs = songs;
	}

	// getters and setters
	
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

	
	// helpers
	
	public List<Song> getSongs() {
		return songs;
	}

	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		result = prime * result + isPrivate;
		result = prime * result
				+ ((playlistName == null) ? 0 : playlistName.hashCode());
		result = prime * result + ((profile == null) ? 0 : profile.hashCode());
		result = prime * result + ((songs == null) ? 0 : songs.hashCode());
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Playlist other = (Playlist) obj;
		if (id != other.id)
			return false;
		if (isPrivate != other.isPrivate)
			return false;
		if (playlistName == null) {
			if (other.playlistName != null)
				return false;
		} else if (!playlistName.equals(other.playlistName))
			return false;
		if (profile == null) {
			if (other.profile != null)
				return false;
		} else if (!profile.equals(other.profile))
			return false;
		if (songs == null) {
			if (other.songs != null)
				return false;
		} else if (!songs.equals(other.songs))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Playlist [id=" + id + ", playlistName=" + playlistName
				+ ", isPrivate=" + isPrivate + "]";
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
