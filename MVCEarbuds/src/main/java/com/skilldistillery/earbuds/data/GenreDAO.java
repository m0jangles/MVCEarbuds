package com.skilldistillery.earbuds.data;

import java.util.List;

import com.skilldistillery.earbuds.entities.Genre;

public interface GenreDAO {
	public List<Genre> getEntireGenreList();
}
