package com.skilldistillery.earbuds.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.earbuds.data.EarbudsDAO;
import com.skilldistillery.earbuds.entities.Profile;
import com.skilldistillery.earbuds.entities.Song;

@Controller
public class EarbudsController {
	@Autowired
	private EarbudsDAO dao;

	@RequestMapping(path = "about.do", method = RequestMethod.GET)
	public String viewAboutPage() {
		return "about";
	}

	@RequestMapping(path = "findUsers.do", method = RequestMethod.GET)
	public String viewUserResults(String searchUserInput, Model model) {
		List<Profile> profiles = dao.searchForUsers(searchUserInput);
		model.addAttribute("profiles", profiles);
		return "results";
	}

	@RequestMapping(path = "findSongs.do", method = RequestMethod.GET)
	public String viewSongResults(String searchSongInput, Model model) {
		List<Song> songs = dao.searchForSongs(searchSongInput);
		model.addAttribute("songs", songs);
		return "results";
	}

}
