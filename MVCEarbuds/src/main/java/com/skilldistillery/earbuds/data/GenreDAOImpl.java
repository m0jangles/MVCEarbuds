package com.skilldistillery.earbuds.data;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Component;

import com.skilldistillery.earbuds.entities.Genre;

@Component
@Transactional
public class GenreDAOImpl implements GenreDAO {
	@PersistenceContext
	private EntityManager em;
	private String query;

	@Override
	public List<Genre> getEntireGenreList() {
		query = "SELECT g FROM Genre g";
		List<Genre> genres = em.createQuery(query, Genre.class).getResultList();
		return genres;
	}

}
