package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.User;

public interface ProfileDAO {
	Profile updateInfo(Profile profile, int id, String city, String state,
			String country);
	public Post addPost(Integer id, String message);
	public List<Post> getAllPosts();
	public boolean deletePost(User user, Integer postId);
}
