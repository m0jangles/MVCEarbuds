package com.skilldistillery.earbuds.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Profile;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;

	@RequestMapping(path = "viewPlaylists.do", params="profile", method = RequestMethod.GET)
	public String viewPlaylists(Model model, Profile profile) {
		
		List<Playlist> playlists = dao.getPlaylists(profile);
		if(playlists != null) {
		model.addAttribute("playlists", playlists);
		}
		return "homepage";
	}
	

}
