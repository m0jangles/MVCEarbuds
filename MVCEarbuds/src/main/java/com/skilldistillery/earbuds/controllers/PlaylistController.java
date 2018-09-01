package com.skilldistillery.earbuds.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.User;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;

	@RequestMapping(path = "viewPlaylists.do", method = RequestMethod.GET)
	public String viewPlaylists(Model model, User user) {
		List<Playlist> list= dao.getPlaylistsByUser(user);
		model.addAttribute(list);
		return "viewPlaylists";
	}
	

}
