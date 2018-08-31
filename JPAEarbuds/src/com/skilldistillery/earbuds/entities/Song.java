package com.skilldistillery.earbuds.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;

@Entity
public class Song {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	private String title;
	private String album;
	@Column(name = "album_image")
	private String albumImage;
	private String url;
	private String artist;
	@ManyToMany
	@JoinTable(name = "playlist_song", joinColumns = @JoinColumn(name = "song_id"), inverseJoinColumns = @JoinColumn(name = "playlist_id"))
	private List<Playlist> playlists;
	@ManyToMany(mappedBy = "songs")
	private List<Genre> genres;

	public Song() {
	}

	public Song(int id, String title, String album, String albumImage, String url, String artist) {
		this.id = id;
		this.title = title;
		this.album = album;
		this.albumImage = albumImage;
		this.url = url;
		this.artist = artist;
	}

	// Getters and Setters

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getAlbum() {
		return album;
	}

	public void setAlbum(String album) {
		this.album = album;
	}

	public String getAlbumImage() {
		return albumImage;
	}

	public void setAlbumImage(String albumImage) {
		this.albumImage = albumImage;
	}

	public String getUrl() {
		return url;
	}

	public void setUrl(String url) {
		this.url = url;
	}

	public String getArtist() {
		return artist;
	}

	public void setArtist(String artist) {
		this.artist = artist;
	}

	public List<Playlist> getPlaylists() {
		return playlists;
	}

	public void setPlaylists(List<Playlist> playlists) {
		this.playlists = playlists;
	}

	public List<Genre> getGenres() {
		return genres;
	}

	public void setGenres(List<Genre> genres) {
		this.genres = genres;
	}

	// Add and Remove Helpers

	@Override
	public String toString() {
		return "Song [id=" + id + ", title=" + title + ", album=" + album + ", albumImage=" + albumImage + ", url="
				+ url + ", artist=" + artist + "]";
	}

}
