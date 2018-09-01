package com.skilldistillery.earbuds.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.PlaylistDAO;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;

	@RequestMapping(path = "viewPlaylists.do", method = RequestMethod.GET)
	public String viewPlaylists() {
		return "viewPlaylists";
	}
}
