package com.skilldistillery.earbuds.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.PlaylistDAO;
import com.skilldistillery.earbuds.entities.Playlist;
import com.skilldistillery.earbuds.entities.Song;

@Controller
public class PlaylistController {

	@Autowired
	private PlaylistDAO dao;

	@RequestMapping(path = "viewPlaylists.do", params="id", method = RequestMethod.GET)
	public String viewPlaylists(Model model, Integer id) {
		
		List<Playlist> playlists = dao.getPlaylists(id);
		if(playlists != null) {
		model.addAttribute("playlists", playlists);
		}
		return "homepage";
	}
	
	@RequestMapping(path = "getSongs.do", params="id", method = RequestMethod.GET)
	public String getSongs(Model model, Integer id) {
		
	List<Song> songs = dao.getSongs(id);
	if(songs != null) {
		model.addAttribute("songs", songs);
	}
		
		return "homepage";
	}

	@RequestMapping(path = "showVideo.do", method = RequestMethod.GET)
	public String showVideo() {
		
		return "homepage";
		
	}
}
