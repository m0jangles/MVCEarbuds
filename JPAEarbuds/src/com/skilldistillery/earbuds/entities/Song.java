package com.skilldistillery.earbuds.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;

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

	@ManyToMany(cascade = { CascadeType.REMOVE, CascadeType.PERSIST })
	@JoinTable(name = "playlist_song",
			joinColumns = @JoinColumn(name = "song_id"),
			inverseJoinColumns = @JoinColumn(name = "playlist_id"))
	private List<Playlist> playlists;

	@ManyToMany(mappedBy = "songs", cascade = CascadeType.ALL,
			fetch = FetchType.EAGER)
	private List<Genre> genres;

	@ManyToMany(mappedBy = "songs")
	private List<Profile> profiles;

	@OneToMany(mappedBy = "song")
	private List<Post> posts;

	// constructors

	public Song() {
	}

	public Song(int id, String title, String album, String albumImage, String url,
			String artist, List<Playlist> playlists, List<Genre> genres) {
		super();
		this.id = id;
		this.title = title;
		this.album = album;
		this.albumImage = albumImage;
		this.url = url;
		this.artist = artist;
		this.playlists = playlists;
		this.genres = genres;
	}

	// Getters & Setters

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

	// Helpers

	public List<Profile> getProfiles() {
		return profiles;
	}

	public void setProfiles(List<Profile> profiles) {
		this.profiles = profiles;
	}

	public List<Post> getPosts() {
		return posts;
	}

	public void setPosts(List<Post> posts) {
		this.posts = posts;
	}

	public void addGenre(Genre genre) {
		if (genres == null)
			genres = new ArrayList<>();

		if (!genres.contains(genre)) {
			genres.add(genre);
			genre.addSong(this);
		}
	}

	public void removeGenre(Genre genre) {
		if (genres != null && genres.contains(genre)) {
			genres.remove(genre);
			genre.removeSong(this);
		}
	}

	public void addPlaylist(Playlist playlist) {
		if (playlists == null) {
			playlists = new ArrayList<>();
		}
		if (!playlists.contains(playlist)) {
			playlists.add(playlist);
			playlist.addSong(this);
		}

	}

	public void removePlaylist(Playlist playlist) {
		if (playlists != null && playlists.contains(playlist)) {
			playlists.remove(playlist);
			playlist.removeSong(this);
		}
	}

	public void addProfile(Profile profile) {
		if (profiles == null)
			profiles = new ArrayList<>();
		if (!profiles.contains(profile)) {
			profiles.add(profile);
			profile.addSong(this);
		}
	}

	public void removeProfile(Profile profile) {
		if (profiles != null && profiles.contains(profile)) {
			profiles.remove(profile);
			profile.removeSong(this);
		}

	}

	public void addPost(Post post) {
		if (posts == null)
			posts = new ArrayList<>();
		if (!posts.contains(post)) {
			posts.add(post);
			if (post.getSong() != null) {
				post.getSong().getPosts().remove(post);
			}
			post.setSong(this);
		}
	}

	public void removePost(Post post) {
		post.setSong(null);
		if (posts != null) {
			posts.remove(post);
		}
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((album == null) ? 0 : album.hashCode());
		result = prime * result
				+ ((albumImage == null) ? 0 : albumImage.hashCode());
		result = prime * result + ((artist == null) ? 0 : artist.hashCode());
		result = prime * result + ((genres == null) ? 0 : genres.hashCode());
		result = prime * result + id;
		result = prime * result + ((playlists == null) ? 0 : playlists.hashCode());
		result = prime * result + ((posts == null) ? 0 : posts.hashCode());
		result = prime * result + ((profiles == null) ? 0 : profiles.hashCode());
		result = prime * result + ((title == null) ? 0 : title.hashCode());
		result = prime * result + ((url == null) ? 0 : url.hashCode());
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
		Song other = (Song) obj;
		if (album == null) {
			if (other.album != null)
				return false;
		} else if (!album.equals(other.album))
			return false;
		if (albumImage == null) {
			if (other.albumImage != null)
				return false;
		} else if (!albumImage.equals(other.albumImage))
			return false;
		if (artist == null) {
			if (other.artist != null)
				return false;
		} else if (!artist.equals(other.artist))
			return false;
		if (genres == null) {
			if (other.genres != null)
				return false;
		} else if (!genres.equals(other.genres))
			return false;
		if (id != other.id)
			return false;
		if (playlists == null) {
			if (other.playlists != null)
				return false;
		} else if (!playlists.equals(other.playlists))
			return false;
		if (posts == null) {
			if (other.posts != null)
				return false;
		} else if (!posts.equals(other.posts))
			return false;
		if (profiles == null) {
			if (other.profiles != null)
				return false;
		} else if (!profiles.equals(other.profiles))
			return false;
		if (title == null) {
			if (other.title != null)
				return false;
		} else if (!title.equals(other.title))
			return false;
		if (url == null) {
			if (other.url != null)
				return false;
		} else if (!url.equals(other.url))
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Song [id=" + id + ", title=" + title + ", album=" + album
				+ ", albumImage=" + albumImage + ", url=" + url + ", artist=" + artist
				+ "]";
	}

	public String getGenresAsString() {
		String s = "";
		String separator = "";
		for (Genre g : getGenres()) {
			s = s + separator + g.getName();
			separator = ", &nbsp;";
		}
		return s;
	}

}
