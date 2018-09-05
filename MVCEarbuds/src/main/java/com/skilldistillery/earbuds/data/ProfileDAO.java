package com.skilldistillery.earbuds.data;

import java.sql.Date;
import java.util.List;

import com.skilldistillery.earbuds.entities.Post;
import com.skilldistillery.earbuds.entities.Profile;

public interface ProfileDAO {
	Profile updateInfo(Profile profile, int id, String city, String state,
			String country);
	public Post addPost(Integer id, String message, Date date);
	public List<Post> getAllPosts();
}
