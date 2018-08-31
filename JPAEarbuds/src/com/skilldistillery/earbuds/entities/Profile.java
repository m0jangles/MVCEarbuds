package com.skilldistillery.earbuds.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Profile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@OneToOne
	@JoinColumn(name = "user_id")
	private User user;

	@Column(name = "image_link")
	private String image;

	@Column(name = "first_name")
	private String firstName;

	@Column(name = "last_name")
	private String lastName;

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@OneToMany(mappedBy = "profile")
	private List<Playlist> playlists;

	// end fields

	public Profile() {

	}

	public Profile(int id, User user, String image, String firstName, String lastName, Location location) {
		super();
		this.id = id;
		this.user = user;
		this.image = image;
		this.firstName = firstName;
		this.lastName = lastName;
		this.location = location;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public List<Playlist> getPlaylists() {
		return playlists;
	}

	public void setPlaylists(List<Playlist> playlists) {
		this.playlists = playlists;
	}

	@Override
	public String toString() {
		return "Profile [id=" + id + ", image=" + image + ", firstName=" + firstName + ", lastName=" + lastName + "]";
	}

	public void addPlaylist(Playlist playlist) {
		if (playlists == null)
			playlists = new ArrayList<>();
		if (!playlists.contains(playlist)) {
			playlists.add(playlist);
			if (playlist.getProfile() != null) {
				playlist.getProfile().getPlaylists().remove(playlist);

			}
			playlist.setProfile(this);

		}
	}

	public void removePlaylist(Playlist playlist) {
		playlist.setProfile(null);
		if (playlists != null) {
			playlists.remove(playlist);
		}
	}

}
