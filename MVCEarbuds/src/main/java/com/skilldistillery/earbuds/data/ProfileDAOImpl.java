package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Location;
import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;
import com.skilldistillery.earbuds.entities.User;

@Component
@Transactional
public class ProfileDAOImpl implements ProfileDAO {

	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public Profile updateInfo(Profile profileWithChanges, int id, String city, String state, String country) {

		// This is the profile that already exists in the database which we are
		// updating with the passed in profile's attributes, which are different.
		// I.e. Use the passed in profile object to set the changes to the profile
		// currently existing in the database.
		Profile managedProfile = em.find(Profile.class, id);

		// See if the location already exists in the database.
		query = "SELECT l FROM Location l WHERE l.city = :city AND l.state = :state";
		List<Location> locationList = em.createQuery(query, Location.class).setParameter("city", city)
				.setParameter("state", state).getResultList();

		// If the size is not 0, then the query found that the location already
		// existed in the database. In one case, this may mean that the user did not
		// change city and state information at all. In the other case, they may
		// have changed city and state information, but we want to check if those
		// already exist in the database. If they do, then just set the user's
		// location to the one which already exists. If not, then we have to create
		// a new location for that city/state combination.
		if (locationList.size() != 0) {

			managedProfile.setLocation(locationList.get(0));

			// We have to make sure that when we change the profile's location, that
			// the location the profile is being set to updates its list of profiles
			// to include that profile.
			// Note that the *addProfile()* method will automatically remove the
			// profile from its old location and set it to the new one.
			locationList.get(0).addProfile(managedProfile);

		}
		// Creating a new location, given that the combination of city/state did not
		// already exist in the database.
		else {

			Location newLocation = new Location();
			newLocation.setCity(city);
			newLocation.setState(state);
			newLocation.setCountry(country);

			managedProfile.setLocation(newLocation);

			em.persist(newLocation);
			em.flush();

			newLocation.addProfile(managedProfile);

		}

		// These fields don't require persisting any new objects into the database.
		// Therefore, it should just run regardless of whether or not the location
		// is new or not.
		managedProfile.setFirstName(profileWithChanges.getFirstName());
		managedProfile.setLastName(profileWithChanges.getLastName());
		managedProfile.setImage(profileWithChanges.getImage());

		return managedProfile;
	}

	public Post addPost(Integer id, String message) {
		Profile profile = em.find(Profile.class, id);

		Post post = new Post();
		post.setProfile(profile);
		post.setMessage(message);
		post.setSong(em.find(Song.class, 1));

		em.persist(post);
		em.flush();

		return post;

	}

	public List<Post> getAllPosts() {
		String query = "Select p from Post p";
		List<Post> posts = em.createQuery(query, Post.class).getResultList();
		return posts;

	}

	@Override
	public boolean deletePost(User user, Integer postId) {
		Post post = em.find(Post.class, postId);
		em.remove(post);
		if (em.find(Post.class, postId) == null) {
			return true;
		} else {
			return false;
		}
	}

}
